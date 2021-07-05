import 'package:flutter/material.dart';

import '../../../shared/helpers/helpers.dart';
import '../../../shared/widgets/widgets.dart';
import '../../../shared/validators/validators.dart';
import '../create_account_controller.dart';

class StepBPage extends StatefulWidget {
  final CreateAccountController controller;

  const StepBPage(this.controller, {Key? key}) : super(key: key);

  @override
  StepBPageState createState() => StepBPageState();
}

class StepBPageState extends State<StepBPage> with KeyboardManager {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    _emailController.text = widget.controller.newUser.email;
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  bool get isStepValid => _formKey.currentState?.validate() == true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: () => hideKeyboard(context),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'E o seu melhor email?',
                  style: AppTypography.kStyleTextHeadline4,
                ),
                SizedBox(height: 14.0),
                TextFormFieldWidget(
                  label: 'Informe seu email',
                  controller: _emailController,
                  onChange: (value) => widget.controller.onChange(email: value),
                  validator: EmailValidator.validate,
                  textInputAction: TextInputAction.done,
                  textInputType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
