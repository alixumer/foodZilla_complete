import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foodzilla/components/custom_app_title.dart';
import 'package:foodzilla/constants.dart';
import 'package:foodzilla/phone_registration/phone_registration.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static String routeName =
      'SplashScreen'; // route Name, Note: all screen must have different route names

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  //now we animate our text using animation class
  //we need animation controller, animation classes in order to animate our text
  //it is asking for a ticket provider to our state

  //we are rebuilding our application in order to see that is there any error?
  //no error found
  //so here our animation started

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat(reverse: true);

  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut);

  //we also need to dispose our animation
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  //now we want to hide our status bar and navigation bar
  //we will use service class in order to hide
  //in the init state we will provide the values and set them to empty

  @override
  void initState() {
    //just set it to empty to hide both status bar and navigation bar
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //we have created our splash screen, now we will go to next screen via timer
    //we use future to go from one screen to the other one
    //it is asking for a duration so we will provide them
    //we have set duration to 5 seconds, mean splash screen will go to other activity after 5 seconds

    //let change it to by pushNamed
    Future.delayed(const Duration(seconds: 5), () {
      //it takes it to the phone registration screen
      //but one more thing here i.e
      //when user back press it again go to splash screen,
      //i show you, it is happening because of timer duration that is set to 5,
      //and we won't go to splash screen on back press, when we are on phone registration screen
      //so change it to PushNamed And RemoveUntil
      Navigator.pushNamedAndRemoveUntil(
          context, PhoneRegistrationScreen.routeName, (route) => false);
    });

    return Scaffold(
      backgroundColor: Color(0xFFd70165),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                'assets/images/splash.png',
                height: 80,
              ),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomAppTitle(
                  title: 'food',
                  color: kTextColorWhite,
                ),
                //wrap our text widget with a rotation transition widget to animate
                //it is asking for turns, so we will now provide our value
                RotationTransition(
                  turns: _animation,
                  child: CustomAppTitle(
                    title: 'Z',
                    color: kTextColorDark,
                  ),
                ),
                RotationTransition(
                  turns: _animation,
                  child: CustomAppTitle(
                    title: 'illa',
                    color: kTextColorWhite,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


