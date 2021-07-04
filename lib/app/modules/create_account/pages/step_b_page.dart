import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../create_account_controller.dart';

class StepBPage extends StatelessWidget {
  final CreateAccountController controller;
  
  const StepBPage(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('E o seu melhor email?'),
          TextFormFieldWidget(
            label: 'Informe seu email',
            validator: (value) {},
            onChange: (value) {},
          ),
        ],
      ),
    );
  }
}
