import 'package:flutter/cupertino.dart';
import 'package:foodzilla/complete_profile_screen/complete_profile_screen.dart';
import 'package:foodzilla/home_screen/home_screen.dart';
import 'package:foodzilla/otp_screen/otp_screen.dart';
import 'package:foodzilla/phone_registration/phone_registration.dart';
import 'package:foodzilla/splash_screen/splash_screen.dart';

//we are separating routes files,all our dart files will be registered here,
//like in android manifest file
final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => SplashScreen(),
  PhoneRegistrationScreen.routeName: (context) => PhoneRegistrationScreen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  CompleteProfileScreen.routeName: (context) => CompleteProfileScreen(),
  HomeScreen.routeName: (context) => HomeScreen(),
};