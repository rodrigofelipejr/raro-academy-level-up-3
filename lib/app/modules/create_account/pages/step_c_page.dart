import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../create_account_controller.dart';

class StepCPage extends StatelessWidget {
  final CreateAccountController controller;

  const StepCPage(
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
          Text('Crie uma senha segura'),
          TextFormFieldWidget(
            label: 'Informe uma senha',
            validator: (value) {},
            onChange: (value) {},
          ),
          Text('A senha deve atender ao seguintes critérios:'),
          Text('Mínimo de 6 caracteres'),
          Text('Incluir números e letras maiúsculas e minúsculas'),
        ],
      ),
    );
  }
}
