import 'package:emeetation_app/views/interests.dart';
import 'package:emeetation_app/views/signin.dart';
import 'package:emeetation_app/views/signup.dart';
import 'package:emeetation_app/views/splashscreen.dart';
import 'package:emeetation_app/views/userPage.dart';
import 'package:emeetation_app/views/welcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: SplashScreen.id,
      //Routes for navigation
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        WelcomeScreen.id: (context) => WelcomeScreen(),
        SignIn.id: (context) => SignIn(),
        SignUp.id: (context) => SignUp(),
        Interests.id: (context) => Interests(),
        UserProfile.id: (context) => UserProfile()
      },
    );
  }
}
