import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../../../shared/validators/validators.dart';
import '../create_account_controller.dart';

class StepDPage extends StatefulWidget {
  final CreateAccountController controller;

  const StepDPage(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  StepDPageState createState() => StepDPageState();
}

class StepDPageState extends State<StepDPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _confirmPasswordController.dispose();
    super.dispose();
  }

  bool get isStepValid => _formKey.currentState?.validate() == true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Agora vamos confirmar'),
            TextFormFieldWidget(
              label: 'Confirme a senha informada',
              controller: _confirmPasswordController,
              obscureText: true,
              onChange: (value) {},
              validator: (value) => PasswordValidator.toCompare(
                value: value,
                compare: widget.controller.newUser.password,
              ),
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.visiblePassword,
            ),
            Text('Lembre-se, a senha deve atender ao seguintes critérios:'),
            Text('Mínimo de 6 caracteres'),
            Text('Incluir números e letras maiúsculas ou minúsculas'),
          ],
        ),
      ),
    );
  }
}
