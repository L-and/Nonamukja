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

  void tokenVerifyCheck() async { // 토큰 유효성검사 후 로그인시도
    await Auth().tokenVerifyRequest().then((response) { // 저장된 토큰으로 로그인 시도
      if (response.statusCode ~/100 == 2) { // 상태코드 2XX > 로그인 성공
        Navigator.of(context).pushReplacementNamed('/index');
        print('[screen_splash]토큰이 유효함! 로그인성공!');
      } else { // 나머지 상태코드 > 로그인 실패
        print('[screen_splash]토큰이 만료됨, 토큰 재발급 시도..');
      }
    }).catchError((error) {
      print('[screen_splash]에러발생.. 토큰 재발급 시도..');
      tryTokenRefresh();
    });
  }

  void tryTokenRefresh() async { // 토큰 재발급 시도
    await Auth().tokenRefreshRequest().then((response) { // 저장된 토큰으로 토큰재발급 시도
      if (response.statusCode ~/100 == 2) { // 상태코드 2XX > 재발급 성공
        Navigator.of(context).pushReplacementNamed('/index');
        print('[screen_splash]재발급토큰이 유효함! 토큰재발급 성공!');
      } else { // 나머지 상태코드 > 재발급 실패
        Navigator.of(context).pushReplacementNamed('/login');
        print('[screen_splash]재발급토큰이 만료됨, 로그인 실패..');
      }
    }).catchError((error) {
      Navigator.of(context).pushReplacementNamed('/login');
      print('[screen_splash]에러발생.. 로그인창으로 이동');
    });
  }

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 1500), () {
      tokenVerifyCheck();
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