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
                TextFormField(
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
                ),
                TextFormField(
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
                ),
                Form(
                  child: ElevatedButton(
                    child: const Text('로그인'),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
