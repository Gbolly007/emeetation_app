import 'dart:convert';

import 'package:http/http.dart' as http;

class Services {
  static const ROOT_LOGIN =
      "https://eme-dev.saas.trood.ru/authorization/api/v1.0/login/";
  static const ROOT_REGISTER =
      "https://eme-dev.saas.trood.ru/authorization/api/v1.0/register/HTTP/1.1";

  //Method to handle user login
  static Future<String> loginUser(String password, String login) async {
    try {
      var response = await http.post(ROOT_LOGIN,
          headers: {
            "Content-Type": "application/json",
            'Accept': 'application/json',
          },
          body: jsonEncode({
            "login": login,
            "password": password,
          }));

      if (response.statusCode == 200) {
        return "Successful";
      } else if (response.statusCode == 401) {
        return "Either username does not exist or password is incorrect";
      } else {
        print(response.body);
        return "An error occurred while trying to log you in, please try again later";
      }
    } catch (e) {
      print(e);
      return "An error occurred while trying to log you in, please try again later";
    }
  }

  //Method to handle user registration
  static Future<String> registerUser(String password, String login) async {
    try {
      var map = Map<String, dynamic>();

      map['login'] = login;
      map['password'] = password;

      var response = await http.post(ROOT_REGISTER,
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode({
            "login": login,
            "password": password,
          }));

      if (response.statusCode == 200) {
        return "Successful";
      } else if (response.statusCode == 401) {
        print(response.statusCode);
        return "Either username does not exist or password is incorrect";
      } else {
        print(response.statusCode);
        return "An error occurred while trying to log you in, please try again later";
      }
    } catch (e) {
      print(e);
      return "An error occurred while trying to log you in, please try again later";
    }
  }
}
