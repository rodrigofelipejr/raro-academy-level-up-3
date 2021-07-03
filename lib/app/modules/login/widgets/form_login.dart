import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sys_app/app/shared/validators/password/passowrd_validator.dart';
import 'package:sys_app/app/shared/validators/validators.dart';

import '../../modules.dart';
import '../../../shared/widgets/widgets.dart';

class FormLoginWidget extends StatefulWidget {
  final LoginController controller;

  const FormLoginWidget({Key? key, required this.controller}) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLoginWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormFieldWidget(
            label: 'Email',
            textInputType: TextInputType.emailAddress,
            onChange: (value) {},
            validator: (value) => EmailValidator.validate(value),
            textInputFormatter: [
              FilteringTextInputFormatter(RegExp(r'\s'), allow: false),
            ],
          ),
          TextFormFieldWidget(
            label: 'Password',
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            onChange: (value) {},
            validator: (value) => PasswordValidator.validate(value),
            textInputAction: TextInputAction.done,
            textInputFormatter: [
              FilteringTextInputFormatter(RegExp(r'\s'), allow: false),
            ],
          ),
          ElevatedButtonWidget(
            onPressed: () {
              final isFormValid = widget.controller.verifyLogin(_formKey);
              print(isFormValid);
            },
            child: Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
