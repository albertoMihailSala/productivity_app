import 'package:flutter/material.dart';
import 'package:productivity_app/login_widget.dart';
import 'signup_widget.dart';
//ignore_for_file: prefer_const_constructors

class AuthPage extends StatefulWidget {
  //const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) => isLogin
      ? LoginWidget(onClickedSignUp: toggle)
      : SignUpWidget(onClickedSignIn: toggle);

  void toggle() => setState(() => isLogin = !isLogin);
}
