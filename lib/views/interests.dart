import 'package:emeetation_app/views/userPage.dart';
import 'package:emeetation_app/widgets/roundedButtonWidget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

class Interests extends StatefulWidget {
  static String id = 'interests_screen';
  @override
  _InterestsState createState() => _InterestsState();
}

class _InterestsState extends State<Interests> {
  List<bool> _check = List.filled(0, false, growable: true);
  List<String> interest = [];
  final List<String> entries = <String>[
    'Music',
    'Art',
    'Business',
    'Education',
    'Health care',
    'Science',
    'Self-development',
    'Spirituality',
    'Sports'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 30),
                  child: Text(
                    "What are you interested in?",
                    style: TextStyle(
                        fontFamily: 'SourceSansSemiBold',
                        color: interestHeaderColor,
                        fontSize: 22,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30.0, top: 30),
                  child: Text(
                    "Type interest",
                    style: TextStyle(
                        fontFamily: 'SourceSansNormal',
                        color: Color(0xFF8E8AA2),
                        fontSize: 18,
                        fontWeight: FontWeight.w900),
                  ),
                ),
                Divider(
                  color: Color(0xFFE1DDF4),
                ),
                ListView.separated(
                  itemCount: entries.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) =>
                      Divider(
                    color: Color(0xFFE1DDF4),
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    _check.add(false);
                    return Padding(
                      padding: const EdgeInsets.only(
                          top: 10.0, bottom: 10, left: 30),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            if (_check[index] == false) {
                              _check[index] = true;
                              interest.add(entries[index]);
                              print(interest);
                            } else {
                              _check[index] = false;
                              interest.remove(entries[index]);
                              print(interest);
                            }
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '${entries[index]}',
                              style: TextStyle(
                                  fontFamily: 'SourceSansNormal',
                                  color: interestHeaderColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            ),
                            _check[index]
                                ? Padding(
                                    padding: const EdgeInsets.only(right: 20.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: submitBgColor,
                                        shape: BoxShape.circle,
                                        border:
                                            Border.all(color: submitBgColor),
                                      ),
                                      child: Icon(
                                        Icons.check,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : SizedBox(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                Divider(
                  color: Color(0xFFE1DDF4),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    SizedBox(),
                    SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: InkWell(
                        onTap: () async {
                          //store interests selected by user in cache
                          if (interest.length != 0) {
                            String interests = interest.join(",");
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();
                            prefs.setString('Interest', interests);
                          }

                          return Navigator.pushNamedAndRemoveUntil(
                              context, UserProfile.id, (route) => false);
                        },
                        child: Icon(
                          Icons.arrow_forward,
                          size: 40,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
