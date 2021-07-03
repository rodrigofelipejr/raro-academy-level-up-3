import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../modules.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../shared/validators/validators.dart';
import '../../../shared/helpers/helpers.dart';

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
            label: 'Informe seu e-mail para redefinir sua senha',
            textInputType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            onChange: (value) => widget.controller.onChange(email: value),
            validator: (value) => EmailValidator.validate(value),
            textInputFormatter: [
              FilteringTextInputFormatter(RegExp(r'\s'), allow: false),
            ],
          ),
          ElevatedButtonWidget(
            onPressed: () async {
              if (_formKey.currentState?.validate() == true) {
                final isValid = await widget.controller.handleRecoverPassword();

                isValid
                    ? showMessage(
                        context,
                        title: 'Sucesso',
                        message: widget.controller.msgEmailSend,
                        label: 'Ir para Login',
                        onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
                        isDismissible: false,
                      )
                    : showMessage(
                        context,
                        title: 'Dados inválidos',
                        message: widget.controller.msgEmailUnsent,
                      );
              }
            },
            child: Text('Recuperar senha'),
          ),
        ],
      ),
    );
  }
}
