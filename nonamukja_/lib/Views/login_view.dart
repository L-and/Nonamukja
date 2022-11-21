import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
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
                ElevatedButton(
                    child: const Text('로그인'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                  ),
                TextButton(
                  child: Text("회원가입"),
                  onPressed: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextFormField EmailTextFormField(){ // 이메일 입력필드
    return TextFormField(
      onSaved: (val) {},
      validator: (val) {
        if (val == null || val.isEmpty) {
          return '이메일을 입력해주세요.';
        }
        return null;
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "이메일",
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }

  TextFormField PasswordTextFormField(){ // 비밀번호 입력필드
    return TextFormField(
      onSaved: (val) {},
      validator: (val) {
        if (val == null || val.isEmpty) {
          return '비밀번호를 입력해주세요.';
        }
        return null;
      },
      decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "비밀번호",
          hintStyle: TextStyle(color: Colors.grey[400])),
    );
  }
}
