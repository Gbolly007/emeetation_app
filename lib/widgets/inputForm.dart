import 'package:flutter/material.dart';

class Inputform extends StatelessWidget {
  final String text;
  final TextEditingController txt;

  Inputform({
    this.text,
    this.txt,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: text,
        hintStyle:
            TextStyle(color: Colors.white, fontFamily: 'SourceSansNormal'),
        enabledBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: new OutlineInputBorder(
          borderRadius: new BorderRadius.circular(5.0),
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
      controller: txt,
      obscureText: text == 'password' ? true : false,
    );
  }
}
