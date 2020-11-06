import 'package:email_validator/email_validator.dart';
import 'package:emeetation_app/function/services.dart';
import 'package:emeetation_app/views/signin.dart';
import 'package:emeetation_app/widgets/inputForm.dart';
import 'package:emeetation_app/widgets/roundedButtonWidget.dart';
import 'package:flutter/material.dart';
import '../constants.dart';
import 'interests.dart';

class SignUp extends StatefulWidget {
  static String id = 'signUp_screen';
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController pwd = TextEditingController();
  final TextEditingController name = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  bool loading = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    userName.dispose();
    pwd.dispose();
    name.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("images/bg.png"), fit: BoxFit.cover),
        ),
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
                            text: 'nickname',
                            txt: name,
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

                                          if (name.text.isEmpty) {
                                            return _scaffoldKey.currentState
                                                .showSnackBar(
                                              new SnackBar(
                                                content: new Text(
                                                    "Please provide nickname"),
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
                                          await Services.registerUser(
                                                  pwd.text, userName.text)
                                              .then((value) {
                                            if (value == "Successful") {
                                              return Navigator
                                                  .pushNamedAndRemoveUntil(
                                                      context,
                                                      Interests.id,
                                                      (route) => false);
                                            } else {
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
                              const EdgeInsets.only(left: 30.0, bottom: 30),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, SignIn.id);
                              },
                              child: RichText(
                                text: TextSpan(
                                  style: TextStyle(fontSize: 16),
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: "Already a user?    ",
                                        style: TextStyle(color: Colors.white)),
                                    TextSpan(
                                      text: "Sign in",
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
