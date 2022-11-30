import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  String _email = "";
  String _password = "";
  String _nickname = "";

  String get email => _email;
  String get password => _password;
  String get nickname => _nickname;

  void set email(String input_email) {
    _email = input_email;
    notifyListeners();
  }

  void set password(String input_password) {
    _password = input_password;
    notifyListeners();
  }

  void set nickname(String input_nickname) {
    _nickname = input_nickname;
    notifyListeners();
  }

  void registerPostRequest() async { // 회원가입 POST 요청
    Uri url = Uri.parse('http://think2022.iptime.org:9900/accounts/signup'); // 회원가입 POST 요청 주소

    http.Response response = await http.post(
      url,
      body: <String, String> {
        'email': _email,
        'password': _password,
        'nickname': _nickname
      },
    );
  }
}