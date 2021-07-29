import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:foodzilla/components/CustomSuffixIcon.dart';
import 'package:foodzilla/components/custom_buttons.dart';
import 'package:foodzilla/constants.dart';
import 'package:foodzilla/home_screen/home_screen.dart';

//initial password will be obscure
late bool _passwordVisible;

//for best practices and code looks clean

class CompleteProfileScreen extends StatefulWidget {
  static String routeName = 'CompleteProfileScreen';

  @override
  _CompleteProfileScreenState createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  //now in the init state set it to true
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _passwordVisible = true;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Create Profile'),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(
              top: kDefaultPadding,
              left: kDefaultPadding / 3,
              right: kDefaultPadding / 3,
              bottom: kDefaultPadding / 3,
            ),
            child: Column(
              children: [
                Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: kPrimaryColor,
                          minRadius: kDefaultPadding * 3,
                          maxRadius: kDefaultPadding * 3,
                          child: SvgPicture.asset(
                            'assets/icons/user.svg',
                            color: kTextColorWhite,
                            height: 50.0,
                          ),
                        ),
                        SizedBox(
                          height: kDefaultPadding * 1.6,
                        ),
                        buildNameField(),
                        SizedBox(
                          height: kDefaultPadding * 1.6,
                        ),
                        buildStateField(),
                        SizedBox(
                          height: kDefaultPadding * 1.6,
                        ),
                        buildCityField(),
                        SizedBox(
                          height: kDefaultPadding * 1.6,
                        ),
                        buildAddressField(),
                        SizedBox(
                          height: kDefaultPadding * 1.6,
                        ),
                        buildEmailField(),
                        SizedBox(
                          height: kDefaultPadding * 1.6,
                        ),
                        buildPasswordField(context),
                        SizedBox(
                          height: kDefaultPadding * 1.6,
                        ),
                        CustomButton(
                            title: 'Save Information',
                            onTap: () {
                              //we want to show here a dialog, to show user that
                              //his/her info is saved
                              if (_formKey.currentState!.validate()) {
                                buildShowDialog(context);
                              }
                            }),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<dynamic> buildShowDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(kDefaultPadding),
                  bottomRight: Radius.circular(kDefaultPadding),
                ),
              ),
              backgroundColor: kScaffoldColor,
              title: Text(
                'Saved',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: kTextColorDark,
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold),
              ),
              content: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Profile created',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: kTextColorLight),
                  ),
                  SizedBox(
                    width: kDefaultPadding / 2,
                  ),
                  SvgPicture.asset('assets/icons/tick.svg'),
                ],
              ),
              actions: [
                CustomButton(
                    title: 'Continue',
                    onTap: () {
                      //navigate to main screen
                      Navigator.pushNamedAndRemoveUntil(
                          context, HomeScreen.routeName, (route) => false);
                    })
              ],
            ));
  }

  TextFormField buildPasswordField(BuildContext context) {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your passsword',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: IconButton(
          icon: Icon(
            //based on passwordVisibility state, we choose icon
            _passwordVisible
                ? Icons.visibility_outlined
                : Icons.visibility_off_outlined,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () {
            //update the state onPressed
            setState(() {
              _passwordVisible = !_passwordVisible;
            });
          },
        ),
      ),
      validator: (value) {
        if (value!.length < 5) {
          return 'Must be more than 5 characters';
        }
      },
      obscureText: _passwordVisible,
    );
  }

  TextFormField buildEmailField() {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'Enter your email',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: 'assets/icons/email.svg',
        ),
      ),
      validator: (value) {
        RegExp regExp = new RegExp(emailPattern);
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        } else if (!regExp.hasMatch(value)) {
          return 'Please enter a valid email address';
        }
      },
    );
  }

  TextFormField buildAddressField() {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        labelText: 'Full Address',
        hintText: 'Enter your address',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: 'assets/icons/location.svg',
        ),
      ),
      validator: (value) {
        if (value!.length < 3) {
          return 'Must be more than 2 characters';
        }
      },
    );
  }

  TextFormField buildCityField() {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        labelText: 'City',
        hintText: 'Enter your city',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: 'assets/icons/location.svg',
        ),
      ),
      validator: (value) {
        if (value!.length < 3) {
          return 'Must be more than 2 characters';
        }
      },
    );
  }

  TextFormField buildStateField() {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        labelText: 'State',
        hintText: 'Enter your state',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: 'assets/icons/location.svg',
        ),
      ),
      validator: (value) {
        if (value!.length < 3) {
          return 'Must be more than 2 characters';
        }
      },
    );
  }

  TextFormField buildNameField() {
    return TextFormField(
      keyboardAppearance: Brightness.light,
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: 'Full Name',
        hintText: 'Enter your name',
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSuffixIcon(
          icon: 'assets/icons/user.svg',
        ),
      ),
      validator: (value) {
        if (value!.length < 3) {
          return 'Name must be more than 2 characters';
        }
      },
    );
  }
}
