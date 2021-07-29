import 'package:flutter/material.dart';
import 'package:foodzilla/components/CustomSuffixIcon.dart';
import 'package:foodzilla/components/custom_buttons.dart';
import 'package:foodzilla/constants.dart';
import 'package:foodzilla/otp_screen/otp_screen.dart';

class PhoneRegistrationScreen extends StatelessWidget {
  static String routeName = 'PhoneRegistrationScreen';
  //key for our form
  final _formKey = GlobalKey<FormState>();

  //we will now add focus on overAll screen in order to,
  //when a user tap on anywhere at the screen, the keyboard close
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(
              bottom: kDefaultPadding / 3,
              top: kDefaultPadding,
              left: kDefaultPadding / 3,
              right: kDefaultPadding / 3,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  'Greetings',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                      //null safety on
                      color: kTextColorDark,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                      shadows: [
                        BoxShadow(
                          color: kPrimaryColor,
                          blurRadius: 1.0,
                        ),
                      ]),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Text(
                  'please enter your phone number',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                        color: kTextColorLight,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 1.0,
                        wordSpacing: 1.0,
                      ),
                ),
                SizedBox(
                  height: kDefaultPadding * 3,
                ), //// mean 20X3 = 60
                //form validations, one last step here
                Form(
                    key: _formKey,
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      keyboardAppearance: Brightness.light,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        hintText: 'Enter your phone',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        suffixIcon: CustomSuffixIcon(
                          icon: 'assets/icons/phone.svg',
                        ),
                      ),
                      validator: (value) {
                        RegExp regExp = new RegExp(mobilePattern);
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        } else if (!regExp.hasMatch(value)) {
                          //if it not matches the value
                          return 'Please enter valid mobile number';
                        }
                      },
                    )),
                //one thing sorry i forget, we have to include it in, i.e already have an account btn,
                SizedBox(
                  height: kDefaultPadding,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      'Already have Account?',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                            color: kTextColorLight,
                            fontWeight: FontWeight.normal,
                            letterSpacing: 1.0,
                            wordSpacing: 1.0,
                          ),
                    ),
                  ),
                ),
                Spacer(),
                //we have separated it because we need it all over the app, many times
                CustomButton(
                  onTap: (){
                    if(_formKey.currentState!.validate()){
                      //if our text is validate, we will go to next screen
                      Navigator.pushNamed(context, OtpScreen.routeName);
                    }
                  },
                  title: 'Send Code',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


