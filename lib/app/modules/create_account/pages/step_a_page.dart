import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../create_account_controller.dart';

class StepAPage extends StatelessWidget {
  final CreateAccountController controller;

  const StepAPage(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Qual o seu nome?'),
          TextFormFieldWidget(
            label: 'Informe seu nome completo',
            validator: (value) {},
            onChange: (value) {},
          ),
        ],
      ),
    );
  }
}
