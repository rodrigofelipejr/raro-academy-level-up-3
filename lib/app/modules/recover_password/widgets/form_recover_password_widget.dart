import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../modules.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../shared/validators/validators.dart';

class FormRecoverPasswordWidget extends StatefulWidget {
  final RecoverPasswordController controller;

  const FormRecoverPasswordWidget(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormRecoverPasswordWidget> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormFieldWidget(
            label: 'Enter your email to rest your password',
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onChange: (value) {},
            validator: (value) => EmailValidator.validate(value),
            textInputFormatter: [
              FilteringTextInputFormatter(RegExp(r'\s'), allow: false),
            ],
          ),
          ElevatedButtonWidget(
            onPressed: () {},
            child: Text('Recover Now'),
          ),
        ],
      ),
    );
  }
}
