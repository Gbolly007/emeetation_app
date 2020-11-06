import 'package:emeetation_app/widgets/roundedButtonWidget.dart';
import 'package:flat_icons_flutter/flat_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart';

class UserProfile extends StatefulWidget {
  static String id = 'userProfile_screen';
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  SharedPreferences sharedPrefs;
  String interests = '';

  @override
  void initState() {
    // TODO: implement initState
    //Retrieve interest selected by user
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPrefs = sp;
      interests = sharedPrefs.getString('Interest');
      // will be null if never previously saved
      if (interests == null) {
        interests = '';
        persist(interests); // set an initial value
      }

      setState(() {});
    });
    super.initState();
  }

  void persist(String value) {
    setState(() {
      interests = value;
    });
    sharedPrefs?.setString('Interest', value);
  }

  Widget interestList() {
    //loop over interest selected by user
    if (interests != '') {
      List<String> stringList = interests.split(",");
      List<Widget> list = List<Widget>();
      for (var i = 0; i < stringList.length; i++) {
        list.add(
          Card(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Container(
                height: 50,
                width: 70,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    stringList[i],
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
        );
      }
      return Wrap(
          alignment: WrapAlignment.start,
          direction: Axis.horizontal,
          runSpacing: 3.0,
          spacing: 5.0,
          children: list);
    } else {
      return Container();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2.5,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/userImage.png"),
                      fit: BoxFit.cover),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                          Icon(
                            FlatIcons.edit,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13.0, bottom: 90),
                      child: Icon(
                        FlatIcons.video_camera,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 290),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: new BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 15.0, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          name,
                          style: TextStyle(
                              fontFamily: 'SourceSansSemiBold',
                              color: interestHeaderColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          position,
                          style: TextStyle(
                              fontFamily: 'SourceSansNormal',
                              color: Color(0xFF8E8AA2),
                              fontSize: 18,
                              fontWeight: FontWeight.w900),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              location,
                              style: TextStyle(
                                  fontFamily: 'SourceSansNormal',
                                  color: Color(0xFF8E8AA2),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w900),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: Row(
                                children: <Widget>[
                                  UserPageIcon(
                                    icn: FontAwesomeIcons.facebookF,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  UserPageIcon(
                                    icn: FontAwesomeIcons.instagram,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Divider(
                          color: dividerColor,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    StatsWidget(
                                      count: "100",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CategoryWidget(
                                      category: "videos",
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 70,
                                color: dividerColor,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    StatsWidget(
                                      count: "20",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CategoryWidget(
                                      category: "likes",
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 1,
                                height: 70,
                                color: dividerColor,
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  children: <Widget>[
                                    StatsWidget(
                                      count: "42",
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    CategoryWidget(
                                      category: "followers",
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Divider(
                          color: dividerColor,
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Text(
                          "Interests",
                          style: TextStyle(
                              fontFamily: 'SourceSansSemiBold',
                              color: interestHeaderColor,
                              fontSize: 22,
                              fontWeight: FontWeight.w900),
                        ),
                        interestList()
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 260,
                left: MediaQuery.of(context).size.width / 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30.0),
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width / 3,
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: submitBgColor,
                      border: Border.all(
                        width: 1,
                        color: submitBgColor,
                      ),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        "Upload Video",
                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final String category;
  CategoryWidget({this.category});

  @override
  Widget build(BuildContext context) {
    return Text(
      category,
      style: TextStyle(
          color: interestHeaderColor,
          fontFamily: 'SourceSansNormal',
          fontSize: 18),
    );
  }
}

class StatsWidget extends StatelessWidget {
  final String count;
  StatsWidget({this.count});

  @override
  Widget build(BuildContext context) {
    return Text(
      count,
      style: TextStyle(
          color: interestHeaderColor,
          fontFamily: 'SourceSansSemiBold',
          fontSize: 30),
    );
  }
}

class UserPageIcon extends StatelessWidget {
  final IconData icn;
  UserPageIcon({this.icn});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: kGeneralColor),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Icon(
          icn,
          size: 20,
          color: kGeneralColor,
        ),
      ),
    );
  }
}
