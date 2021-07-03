import 'package:flutter/material.dart';

import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Login'),
      ),
    );
  }
}
