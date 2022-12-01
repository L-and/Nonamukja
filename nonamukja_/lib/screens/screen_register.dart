import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:nonamukja/models/auth.dart';
import 'package:nonamukja/provider/provider_user.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();

  UserProvider userProvider = new UserProvider(); // 데이터관리를 위한 프로바이더 변수

  var tmpPassword;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Form(
        key: _formKey,
        child: Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EmailTextFormField(), // 이메일 입력창
                PasswordTextFormField(), // 비밀번호 입력창
                PasswordCheckTextFormField(), // 비밀번호 확인 입력창
                NicknameTextFormField(),
                renderSubmitButton() // 회원가입버튼 렌더링
              ],
            ),
          ),
        ),
      ),
    );
  }


  renderSubmitButton() {
    return ElevatedButton(
      child: const Text('회원가입'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          userProvider.registerPostRequest();
        }
      },
    );
  }

  TextFormField NicknameTextFormField() {
    return TextFormField(
      onSaved: (val) {},
      validator: (val) {
        if (val == null || val.isEmpty) {
          return '닉네임을 입력해주세요.';
        }
        else {
          userProvider.nickname = val;
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "닉네임",
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }

  // 이메일 텍스트폼필드
  TextFormField EmailTextFormField(){
    return TextFormField(
      validator: (val) {
        if (val == null || val.isEmpty) {
          return '이메일을 입력해주세요.';
        }

        if(emailValidation(val)){
           userProvider.email = val;
        }
        else{
          return '이메일을 다시 입력해주세요.';
        }
      },
      keyboardType: TextInputType.emailAddress, // 이메일형식으로 입력받도록 설정
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "이메일",
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }

// 비밀번호 텍스트폼필드
  TextFormField PasswordTextFormField(){
    return TextFormField(
      obscureText: true, // 화면에 표시되지않게 설정
      validator: (val) {
        if (val == null || val.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }

        if(passwordValidation(val)){
          tmpPassword = val; // 비밀번호 임시저장
        }
        else{
          return '대소문자,숫자,특수문자 포함 8글자이상으로 입력해주세요.';
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "비밀번호",
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }

// 비밀번호 확인 텍스트폼필드
  TextFormField PasswordCheckTextFormField(){
    return TextFormField(
      obscureText: true, // 화면에 표시되지않게 설정
      validator: (val) {
        if (val == null || val.isEmpty) {
          return '비밀번호를 다시한번 입력해주세요.';
        }

        if(passwordCheckValidation(val)){
          userProvider.password = sha256.convert(utf8.encode(val)).toString(); // 비밀번호를 해쉬값으로 저장
        }
        else{
          return '입력한 비밀번호와 일치하지 않습니다.';
        }
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "비밀번호 확인",
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }

// 이메일 형식검사 Validator
  bool emailValidation(String email) {
    RegExp emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (emailValid.hasMatch((email))) {
      return true;
    }
    else {
      return false;
    }
  }

// 비밀번호 형식검사 Validator
  bool passwordValidation(String password) {
    RegExp passwordValid = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (passwordValid.hasMatch((password))) {
      return true;
    }
    else {
      return false;
    }
  }

// 비밀번호입력 검사 Validator
  bool passwordCheckValidation(String password) {
    if (password == this.tmpPassword) {
      return true;
    }
    else {
      return false;
    }
  }
}