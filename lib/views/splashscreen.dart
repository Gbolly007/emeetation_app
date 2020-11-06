import 'dart:async';
import 'package:emeetation_app/constants.dart';
import 'package:emeetation_app/views/welcomeScreen.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    startSplashCreen();
  }

  //Delay function for splash screen for 3 seconds
  startSplashCreen() async {
    var duration = const Duration(seconds: 3);

    return Timer(duration, () {
      return Navigator.pushNamedAndRemoveUntil(
          context, WelcomeScreen.id, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: roundSocialIconColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Image.asset(
              "images/logo-black.png",
              width: 200,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}
