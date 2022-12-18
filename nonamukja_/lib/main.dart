import 'package:flutter/material.dart';
import 'package:nonamukja/screens/screen_post_create.dart';
import 'package:provider/provider.dart';
import 'screens/screen_login.dart';
import 'screens/screen_register.dart';
import 'screens/screen_splash.dart';
import 'screens/screen_index.dart';
import 'screens/screen_search.dart';
import 'screens/screen_post.dart';
import 'screens/screen_post_create.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MaterialApp(
      title: '노나묵자',
      routes: {
        '/': (context) => SplashScreen(), // 로그인검사 화면
        '/login': (context) => LoginScreen(), // 로그인 화면
        '/register': (context) => RegisterScreen(), // 회원가입 화면
        '/index': (context) => IndexScreen(), // 메인 화면
        '/post': (context) => PostScreen(), // 게시글 화면
        '/post_create': (context) => PostCreateScreen(), // 게시글 생성 화면
        '/search': (context) => SearchScreen(), // 검색 화면
      },
      initialRoute: '/',
      )
    );
  }
}
