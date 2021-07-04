import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../create_account_controller.dart';

class StepDPage extends StatelessWidget {
  final CreateAccountController controller;

  const StepDPage(
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
          Text('Agora vamos confirmar'),
          TextFormFieldWidget(
            label: 'Confirme a senha informada',
            validator: (value) {},
            onChange: (value) {},
          ),
          Text('Lembre-se, a senha deve atender ao seguintes critérios:'),
          Text('Mínimo de 6 caracteres'),
          Text('Incluir números e letras maiúsculas e minúsculas'),
        ],
      ),
    );
  }
}
