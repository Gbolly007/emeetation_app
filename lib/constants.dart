import 'package:flutter/material.dart';

const kGeneralColor = Color(0xFF7017E1);
const headerStyle = TextStyle(
    fontFamily: 'SourceSansSemiBold',
    color: kGeneralColor,
    fontSize: 40,
    fontWeight: FontWeight.w900);
const forgotPassword = "Forgot your password?";
const roundSocialIconColor = Colors.white;
const submitBgColor = Color(0xFF0FF92D);
const submitIconColor = Colors.white;
const interestHeaderColor = Color(0xFF373160);
const dividerColor = Color(0xFFE1DDF4);
const signInHeaderText1 = Text(
  "Welcome",
  style: headerStyle,
);
const signInHeaderText2 = Text(
  "to Emeetation!",
  style: headerStyle,
);

var circularProgButton = CircularProgressIndicator(
  strokeWidth: 2,
  valueColor: AlwaysStoppedAnimation<Color>(submitBgColor),
);

var name = "Ivan Zheltov";
var position = "Front End Developer";
var location = "Russia, Moscow";
var appName = "Emeetation";
