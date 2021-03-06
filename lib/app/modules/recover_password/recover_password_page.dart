import 'package:flutter/material.dart';

import '../../shared/helpers/helpers.dart';
import 'recover_password_controller.dart';
import 'widgets/form_recover_password_widget.dart';

class RecoverPasswordPage extends StatefulWidget {
  const RecoverPasswordPage({Key? key}) : super(key: key);

  @override
  _RecoverPasswordPageState createState() => _RecoverPasswordPageState();
}

class _RecoverPasswordPageState extends State<RecoverPasswordPage> with KeyboardManager {
  RecoverPasswordController controller = RecoverPasswordController();

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Esqueceu a senha?',
                    style: AppTypography.kStyleTextHeadline4,
                  ),
                  SizedBox(height: 16.0),
                  FormRecoverPasswordWidget(controller),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
