import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String _email = "";
  String _password = "";

  String get email => _email;
  String get password => _password;

  set email(String input_email) {
    _email = input_email;
    notifyListeners();
  }

  set password(String input_password) {
    _password = input_password;
    notifyListeners();
  }

  Future<http.Response> authRequest() async { // 회원가입 POST 요청
    Uri url = Uri.parse('http://think2022.iptime.org:9900/accounts/token/'); // 토큰 POST 요청 주소

    Map<String, String> loginJson = {
      'email': _email,
      'password': _password,
    };

    http.Response response = await http.post(
        url,
        body: loginJson
    );

    return response;
  }
}