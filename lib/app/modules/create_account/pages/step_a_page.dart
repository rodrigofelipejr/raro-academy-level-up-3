import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../../../shared/validators/validators.dart';
import '../create_account_controller.dart';

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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Qual o seu nome?'),
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
