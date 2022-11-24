import 'package:flutter/material.dart';
import 'screens/screen_login.dart';
import 'screens/screen_register.dart';
import 'screens/screen_splash.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '노나묵자',
      routes: {
        '/': (context) => SplashScreen(), // 로그인검사 화면
        '/login': (context) => LoginScreen(), // 로그인 화면
        '/register': (context) => RegisterScreen(), // 회원가입 화면
      },
      initialRoute: '/',
    );
  }
}
