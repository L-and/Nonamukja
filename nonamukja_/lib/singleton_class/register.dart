import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Register {
  // 싱글톤패턴을 위한 코드
  Register._privateConstructor(); // Private 생성자 생성
  // 생성자를 호출하고 _instance 변수에 할당
  static final Register _instance = Register._privateConstructor();

  // 호출시에 _instance 변수를 반환
  factory Register() {
    return _instance;
  }

  String _email = "";
  String _password = "";
  String _nickname = "";

  String get email => _email;
  String get password => _password;
  String get nickname => _nickname;

  set email(String input_email) {
    _email = input_email;
  }

  set password(String input_password) {
    _password = input_password;
  }

  set nickname(String input_nickname) {
    _nickname = input_nickname;
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