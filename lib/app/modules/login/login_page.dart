import 'package:flutter/material.dart';
import 'package:sys_app/app/shared/helpers/helpers.dart';

import 'login_controller.dart';
import 'widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with KeyboardManager {
  LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () => hideKeyboard(context),
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              child: Column(
                children: [
                  LogoWidget(),
                  SizedBox(height: 28.0),
                  FormLoginWidget(controller: controller),
                  SizedBox(height: 22.0),
                  CreateAccountWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
