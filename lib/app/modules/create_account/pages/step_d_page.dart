import 'package:flutter/material.dart';

import '../../../shared/helpers/helpers.dart';
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

class StepDPageState extends State<StepDPage> with KeyboardManager {
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
    return SafeArea(
      child: GestureDetector(
        onTap: () => hideKeyboard(context),
        child: Container(
          padding: const EdgeInsets.fromLTRB(24.0, 0, 24.0, 72.0),
          child: Form(
            key: _formKey,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Agora vamos confirmar',
                    style: AppTypography.kStyleTextHeadline4,
                  ),
                  SizedBox(height: 14.0),
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
                  SizedBox(height: 18.0),
                  Text(
                    'Lembre-se, a senha deve atender ao seguintes critérios:',
                    style: AppTypography.kStyleTextHeadline6,
                  ),
                  SizedBox(height: 14.0),
                  Text(
                    '- Mínimo de 6 caracteres;',
                    style: AppTypography.kStyleTextBody2,
                  ),
                  Text(
                    '- Incluir números e letras maiúsculas ou minúsculas;',
                    style: AppTypography.kStyleTextBody2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
