// 저장되어있는 토큰값을 확인 후
// 유효하면 메인화면, 유효하지않으면 로그인화면으로 이동시킴

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<bool> tokenValidCheck() async { // 로컬에 저장된 토큰을 받아와 유효성을 검사 후 유효하면 로그인, 유효하지않으면 refreshToken으로 토큰 재발급
    String validateUrl = '';

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? tokenList = prefs.getStringList('TokenList'); // 로컬에 저장된토큰갑 가져오기

    http.Response response = await http.Request


    return isLogin;
  }

  void moveScreen() async {
    await tokenValidCheck().then((isLogin) {
      if (isLogin) {
        Navigator.of(context).pushReplacementNamed('/index');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      moveScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Center(
        child: Text('splash Screen'),
      )
    );
  }
}