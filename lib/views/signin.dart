import 'package:email_validator/email_validator.dart';
import 'package:emeetation_app/function/services.dart';
import 'package:emeetation_app/views/signup.dart';
import 'package:emeetation_app/views/userPage.dart';
import 'package:emeetation_app/widgets/inputForm.dart';
import 'package:emeetation_app/widgets/roundedButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../constants.dart';

class SignIn extends StatefulWidget {
  static String id = 'signIn_screen';
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController pwd = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userName.dispose();
    pwd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg.png"), fit: BoxFit.cover)),
        child: Scaffold(
          key: _scaffoldKey,
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding: const EdgeInsets.only(top: 70.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        signInHeaderText1,
                        signInHeaderText2,
                        SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                child: RoundedButtonWidget(
                                  icons: FontAwesomeIcons.facebookF,
                                  bgColor: roundSocialIconColor,
                                  iconColor: kGeneralColor,
                                  onPush: () {},
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                child: RoundedButtonWidget(
                                  icons: FontAwesomeIcons.linkedinIn,
                                  bgColor: roundSocialIconColor,
                                  iconColor: kGeneralColor,
                                  onPush: () {},
                                ),
                              ),
                              Container(
                                width: 60,
                                height: 60,
                                child: RoundedButtonWidget(
                                  icons: FontAwesomeIcons.instagram,
                                  bgColor: roundSocialIconColor,
                                  iconColor: kGeneralColor,
                                  onPush: () {},
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Divider(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Inputform(
                            text: 'email',
                            txt: userName,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: Inputform(
                            text: 'password',
                            txt: pwd,
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 30.0),
                              child: Text(
                                forgotPassword,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'SourceSansNormal'),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(),
                            SizedBox(),
                            Padding(
                              padding: const EdgeInsets.only(right: 20.0),
                              child: loading
                                  ? Center(
                                      child: Container(
                                        child: circularProgButton,
                                      ),
                                    )
                                  : Container(
                                      width: 60,
                                      height: 60,
                                      child: RoundedButtonWidget(
                                        icons: Icons.arrow_forward,
                                        bgColor: submitBgColor,
                                        iconColor: submitIconColor,
                                        //Method that handles login
                                        onPush: () async {
                                          if (userName.text.isEmpty) {
                                            return _scaffoldKey.currentState
                                                .showSnackBar(
                                              new SnackBar(
                                                content: new Text(
                                                    "Missing email, please enter valid email"),
                                              ),
                                            );
                                          }

                                          if (!EmailValidator.validate(
                                              userName.text)) {
                                            return _scaffoldKey.currentState
                                                .showSnackBar(
                                              new SnackBar(
                                                content: new Text(
                                                    "Please enter a valid email"),
                                              ),
                                            );
                                          }

                                          if (pwd.text.isEmpty ||
                                              pwd.text.length < 6) {
                                            return _scaffoldKey.currentState
                                                .showSnackBar(
                                              new SnackBar(
                                                content: new Text(
                                                    "Password must contain at least 6 characters"),
                                              ),
                                            );
                                          }
                                          setState(() {
                                            loading = true;
                                          });

                                          await Services.loginUser(
                                                  pwd.text, userName.text)
                                              .then((value) {
                                            if (value == "Successful") {
                                              //if username and password is correct
                                              return Navigator
                                                  .pushNamedAndRemoveUntil(
                                                      context,
                                                      UserProfile.id,
                                                      (route) => false);
                                            } else {
                                              //if username and password is incorrect or exception occurs
                                              setState(() {
                                                loading = false;
                                              });
                                              _scaffoldKey.currentState
                                                  .showSnackBar(
                                                new SnackBar(
                                                  content: new Text(value),
                                                ),
                                              );
                                            }
                                          });
                                        },
                                      ),
                                    ),
                            ),
                          ],
                        ),
                        Spacer(),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 30.0, bottom: 50),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, SignUp.id);
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 16),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "New user? ",
                                        style: TextStyle(color: Colors.white)),
                                    TextSpan(
                                      text: "Create an account",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700,
                                        decoration: TextDecoration.underline,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
