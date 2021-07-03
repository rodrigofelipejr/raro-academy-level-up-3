import 'package:flutter/material.dart';

import 'create_account_controller.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({Key? key}) : super(key: key);

  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final CreateAccountController controller = CreateAccountController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Create Account'),
      ),
    );
  }
}
