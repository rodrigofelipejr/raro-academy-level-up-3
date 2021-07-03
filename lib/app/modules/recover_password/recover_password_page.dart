import 'package:flutter/material.dart';

import 'recover_password_controller.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> {
  RecoverPasswordController controller = RecoverPasswordController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Recuperar senha'),
      ),
    );
  }
}
