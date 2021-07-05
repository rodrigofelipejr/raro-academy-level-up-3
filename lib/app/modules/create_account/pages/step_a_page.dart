import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../../../shared/validators/validators.dart';
import '../create_account_controller.dart';
import '../../../shared/helpers/helpers.dart';

class StepAPage extends StatefulWidget {
  final CreateAccountController controller;

  const StepAPage(
    this.controller, {
    Key? key,
  }) : super(key: key);

  @override
  StepAPageState createState() => StepAPageState();
}

class StepAPageState extends State<StepAPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    _nameController.text = widget.controller.newUser.name;
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  bool get isStepValid => _formKey.currentState?.validate() == true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Qual o seu nome?',
              style: AppTypography.kStyleTextHeadline4,
            ),
            SizedBox(height: 14.0),
            TextFormFieldWidget(
              label: 'Informe seu nome completo',
              controller: _nameController,
              onChange: (value) => widget.controller.onChange(name: value),
              validator: NameValidator.validate,
              textInputAction: TextInputAction.done,
              textInputType: TextInputType.name,
            ),
          ],
        ),
      ),
    );
  }
}
