// 저장되어있는 토큰값을 확인 후
// 유효하면 메인화면, 유효하지않으면 로그인화면으로 이동시킴

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:nonamukja/singleton_class/auth.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void moveScreen() async {
    await Auth().tokenVerifyRequest().then((response) {
      if (response.statusCode ~/100 == 2) { // 상태코드 2XX > 로그인 성공
        Navigator.of(context).pushReplacementNamed('/index');
        print('[screen_splash]토큰이 유효함! 로그인성공!');
      } else {
        Navigator.of(context).pushReplacementNamed('/login');
        print('[screen_splash]토큰이 만료됨, 로그인실패..');
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