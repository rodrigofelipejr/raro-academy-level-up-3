import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../modules.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../shared/validators/validators.dart';
import '../../../shared/helpers/helpers.dart';

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
            onChange: (value) => widget.controller.onChange(email: value),
            validator: (value) => EmailValidator.validate(value),
            textInputFormatter: [
              FilteringTextInputFormatter(RegExp(r'\s'), allow: false),
            ],
          ),
          TextFormFieldWidget(
            label: 'Password',
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            onChange: (value) => widget.controller.onChange(password: value),
            validator: (value) => PasswordValidator.validate(value),
            textInputAction: TextInputAction.done,
            textInputFormatter: [
              FilteringTextInputFormatter(RegExp(r'\s'), allow: false),
            ],
          ),
          ElevatedButtonWidget(
            onPressed: () async {
              if (_formKey.currentState?.validate() == true) {
                final isValid = await widget.controller.handleAuthentication();

                isValid
                    ? Navigator.pushReplacementNamed(context, AppRoutes.home)
                    : showMessage(context, message: 'Credenciais inválidas!');
              }
            },
            child: Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
