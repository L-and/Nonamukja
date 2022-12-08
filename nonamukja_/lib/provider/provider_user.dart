import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  String _email = "";
  String _password = "";
  String _nickname = "";

  String get email => _email;
  String get password => _password;
  String get nickname => _nickname;

  set email(String input_email) {
    _email = input_email;
    notifyListeners();
  }

  set password(String input_password) {
    _password = input_password;
    notifyListeners();
  }

  set nickname(String input_nickname) {
    _nickname = input_nickname;
    notifyListeners();
  }

  Future<int> registerPostRequest() async { // 회원가입 POST 요청
    Uri url = Uri.parse('http://think2022.iptime.org:9900/accounts/signup'); // 회원가입 POST 요청 주소

    Map<String, String> registerJson = {
      'email': _email,
      'password': _password,
      'nickname': _nickname
    };

    http.Response response = await http.post(
      url,
      body: registerJson,
    );

    return response.statusCode;
  }
}