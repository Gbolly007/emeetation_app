import 'package:dots_indicator/dots_indicator.dart';
import 'package:emeetation_app/constants.dart';
import 'package:emeetation_app/views/secondPage.dart';
import 'package:emeetation_app/views/signin.dart';
import 'package:emeetation_app/views/thirdPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'firstPage.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentPageIndex;
  int pageLength;

  @override
  void initState() {
    // TODO: implement initState
    currentPageIndex = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            PageView(
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                FirstPage(),
                SecondPage(),
                ThirdPage(),
              ],
              onPageChanged: (value) {
                //change value of pageIndex
                setState(() {
                  currentPageIndex = value;
                });
              },
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new DotsIndicator(
                        dotsCount: pageLength,
                        position: currentPageIndex.toDouble(),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: InkWell(
                      onTap: () {
                        return Navigator.pushNamedAndRemoveUntil(
                            context, SignIn.id, (route) => false);
                      },
                      child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width / 2,
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: kGeneralColor,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            currentPageIndex.toString() == "2"
                                ? "Continue"
                                : "Skip",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
