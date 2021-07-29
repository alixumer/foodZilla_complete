import 'package:flutter/material.dart';
import 'package:foodzilla/constants.dart';
import 'package:foodzilla/routes.dart';
import 'package:foodzilla/splash_screen/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kScaffoldColor,
          primaryColor: kPrimaryColor,
          canvasColor: kScaffoldColor,
          appBarTheme: AppBarTheme(
            iconTheme: IconThemeData(
              color: Colors.white,
            )
          ),
          textTheme: GoogleFonts.robotoMonoTextTheme(),
inputDecorationTheme: InputDecorationTheme( //because we need that theme decoration for all textFormField in all over the app, so we have set it in our theme
    border: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft:
        Radius.circular(kDefaultPadding), //at top left
        bottomRight: Radius.circular(
            kDefaultPadding), // at top right
      ),
      gapPadding: 0,
    ),
    focusColor: kPrimaryColor,
    hoverColor: kPrimaryColor,
    fillColor: kPrimaryColor,
    hintStyle: TextStyle(color: kTextColorDark),
    labelStyle: TextStyle(color: kTextColorDark),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft:
        Radius.circular(kDefaultPadding), //at top left
        bottomRight: Radius.circular(
            kDefaultPadding), // at top right
      ),
      gapPadding: 0,
      borderSide:
      BorderSide(color: kOutlineInputColor, width: 0.4),
    ),
    //on hover it is set to blue, we change it now to other color,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.only(
        topLeft:
        Radius.circular(kDefaultPadding), //at top left
        bottomRight: Radius.circular(
            kDefaultPadding), // at top right
      ),
      gapPadding: 0,
      borderSide: BorderSide(
          color: kPrimaryColor, width: 0.5), //changed
    ),
    //error border color
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 0.6),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kDefaultPadding),
        bottomRight: Radius.circular(kDefaultPadding),
      ),
    ),
    //focus error border color
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 0.6),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(kDefaultPadding),
        bottomRight: Radius.circular(kDefaultPadding),
      ),
    )
)
          ),
      initialRoute: SplashScreen.routeName, // initial route will be splash screen
      routes: routes,
    );
  }
}
