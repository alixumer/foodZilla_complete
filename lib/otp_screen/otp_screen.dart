import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodzilla/complete_profile_screen/complete_profile_screen.dart';
import 'package:foodzilla/components/custom_buttons.dart';
import 'package:foodzilla/constants.dart';

class OtpScreen extends StatefulWidget {

  static String routeName = 'OtpScreen';

  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final _formKey = GlobalKey<FormState>();

  late FocusNode _node2;

  late FocusNode _node3;

  late FocusNode _node4;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _node2 = FocusNode();
    _node3 = FocusNode();
    _node4 = FocusNode();
  }

  //we also need to dispose it
  @override
  void dispose() {
    _node2.dispose();
    _node3.dispose();
    _node4.dispose();
    super.dispose();
  }

  void next({String? value, FocusNode? focusNode}){
    if(value!.length == 1){
      focusNode!.requestFocus();
    }
  }

  //validate our fields
  //when field is empty and user press the button, it shows error
  _buildError(){
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Code Error'))
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Otp Verification'),
        ),
        body: SafeArea(
          child: Padding(
            //we use the same padding, like in phone registration screen
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
                  'please enter 4 digit code\nwe have sent to your number',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      fontWeight: FontWeight.normal,
                      color: kTextColorLight,
                      letterSpacing: 1.0,
                      wordSpacing: 1.0),
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            margin: EdgeInsets.all(kDefaultPadding),
                            width: 40.0,
                            height: 40.0,
                            child: TextFormField(
                              autofocus:
                                  true, //when we go to this screen, this field will be automatically focused
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(
                                    1), //only 1 digit
                              ],
                              decoration: InputDecoration(),
                              textInputAction: TextInputAction.next,
                              keyboardAppearance: Brightness.light,
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              onChanged: (value){
                                next(value: value, focusNode: _node2);
                              },
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return _buildError();
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(kDefaultPadding),
                            width: 40.0,
                            height: 40.0,
                            child: TextFormField(
                              focusNode: _node2,
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(
                                    1), //only 1 digit
                              ],
                              decoration: InputDecoration(),
                              textInputAction: TextInputAction.next,
                              keyboardAppearance: Brightness.light,
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              onChanged: (value){
                                next(value: value, focusNode: _node3);
                              },
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return _buildError();
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(kDefaultPadding),
                            width: 40.0,
                            height: 40.0,
                            child: TextFormField(
                              focusNode: _node3,
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(
                                    1), //only 1 digit
                              ],
                              decoration: InputDecoration(),
                              textInputAction: TextInputAction.next,
                              keyboardAppearance: Brightness.light,
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              onChanged: (value){
                                next(value: value, focusNode: _node4);
                              },
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return _buildError();
                                }
                              },
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(kDefaultPadding),
                            width: 40.0,
                            height: 40.0,
                            child: TextFormField(
                              focusNode: _node4,
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(
                                    1), //only 1 digit
                              ],
                              decoration: InputDecoration(),
                              textInputAction: TextInputAction.next,
                              keyboardAppearance: Brightness.light,
                              keyboardType: TextInputType.phone,
                              textAlign: TextAlign.center,
                              onChanged: (value){
                                _node4.unfocus();
                              },
                              validator: (value){
                                if(value == null || value.isEmpty){
                                  return _buildError();
                                }
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Code expires in: ',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.normal, color: kTextColorLight),
                    ),
                    TweenAnimationBuilder(
                        tween: IntTween(begin: 60, end: 0),
                        duration: Duration(seconds: 60),
                        builder: (context, int value, child)
                        => Text("${value.toInt()}",
                        style: Theme.of(context).textTheme.subtitle2!.copyWith(
                          fontWeight: FontWeight.normal,
                          color: kPrimaryColor
                        ),)),
                  ],
                ),
                Spacer(),
                CustomButton(title: 'Verify Me', onTap: (){
                  if(_formKey.currentState!.validate()){
                    Navigator.pushNamed(context, CompleteProfileScreen.routeName);
                  }
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
