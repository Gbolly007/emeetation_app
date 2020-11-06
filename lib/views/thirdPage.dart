import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SvgPicture.asset('images/question.svg'),
          ),
        ),
        Flexible(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text(
                  'Search for connections to boost your career',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20,
                      height: 1.5,
                      fontFamily: "Merriweather",
                      color: Colors.grey.shade600),
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
