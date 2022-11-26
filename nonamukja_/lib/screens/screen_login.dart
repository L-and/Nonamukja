import 'package:flutter/material.dart';
import 'screen_register.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

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
                renderSubmitButton(), // 로그인버튼
                RegisterTextButton(), // 회원가입창으로 이동하는 버튼
              ],
            ),
          ),
        ),
      ),
    );
  }

  RegisterTextButton() {
    return TextButton(
        child: Text("회원가입"),
        onPressed: (){
          Navigator.of(context).pushNamed('/register');
        }
    );
  }

  renderSubmitButton() {
    return ElevatedButton(
      child: const Text('로그인'),
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          print(email);
          print(password);
          Navigator.of(context).pushReplacementNamed('/index'); // 메인화면으로 이동
        }
      },
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
          email = val;
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
          password = val;
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

}