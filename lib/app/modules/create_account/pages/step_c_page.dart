import 'package:flutter/material.dart';

import '../../../shared/helpers/helpers.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../shared/validators/validators.dart';
import '../create_account_controller.dart';

class StepCPage extends StatefulWidget {
  final CreateAccountController controller;

  const StepCPage(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  StepCPageState createState() => StepCPageState();
}

class StepCPageState extends State<StepCPage> with KeyboardManager {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _passwordController.text = widget.controller.newUser.password;
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Crie uma senha segura!',
                  style: AppTypography.kStyleTextHeadline4,
                ),
                SizedBox(height: 14.0),
                TextFormFieldWidget(
                  label: 'Informe uma senha',
                  controller: _passwordController,
                  obscureText: true,
                  onChange: (value) => widget.controller.onChange(password: value),
                  validator: PasswordValidator.validate,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 18.0),
                Text(
                  'A senha deve atender ao seguintes critérios:',
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
    );
  }
}
