import 'package:flutter/material.dart';

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
            label: 'E-mail',
            textInputType: TextInputType.emailAddress,
            onChange: (value) {},
            validator: (value) => null,
          ),
          TextFormFieldWidget(
            label: 'Password',
            textInputType: TextInputType.visiblePassword,
            obscureText: true,
            onChange: (value) {},
            validator: (value) => null,
            textInputAction: TextInputAction.done,
          ),
          ElevatedButtonWidget(
            onPressed: () {},
            child: Text('Entrar'),
          ),
        ],
      ),
    );
  }
}
