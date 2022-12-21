import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Auth {
  // Private한 생성자 생성
  Auth._privateConstructor();
  // 생성자를 호출하고 반환된 Singleton 인스턴스를 _instance 변수에 할당
  static final Auth _instance = Auth._privateConstructor();
// 호출시에 _instance 변수를 반환
  factory Auth() {
    return _instance;
  }

  String _email = "";
  String _password = "";

  String get email => _email;
  String get password => _password;

  set email(String input_email) {
    _email = input_email;
  }

  set password(String input_password) {
    _password = input_password;
  }

  Future<http.Response> loginRequest() async { // 로그인인증 POST 요청
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

  Future<http.Response> tokenVerifyRequest() async { // 토큰 유효성검사 POST 요청
    final prefs = await SharedPreferences.getInstance(); // 로컬데이터 사용을 위한 변수

    Uri url = Uri.parse('http://think2022.iptime.org:9900/accounts/token/verify/'); // 토큰 유효성검사 주소

    Map<String, String?> tokenJson = {
      'token': prefs.getStringList('TokenList')?[1]
    };

    http.Response response = await http.post(
      url,
      body: tokenJson
    );


    print(prefs.getStringList('TokenList'));
    return response;
  }

  Future<http.Response> tokenRefreshRequest() async { // 토큰 재발급 요청
    final prefs = await SharedPreferences.getInstance(); // 로컬데이터 사용을 위한 변수

    Uri url = Uri.parse('http://think2022.iptime.org:9900/accounts/token/verify/'); // 토큰 재발급 주소

    Map<String, String?> tokenJson = {
      'refresh': prefs.getStringList('TokenList')?[0]
    };

    http.Response response = await http.post(
        url,
        body: tokenJson
    );

    return response;
  }
}