import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../../../shared/helpers/helpers.dart';

class ForgotPasswordWidget extends StatelessWidget {
  const ForgotPasswordWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 14.0),
          child: TextButtonWidget(
            label: 'Forgot Password?',
            onPressed: () => Navigator.of(context).pushNamed(AppRoutes.recoverPassword),
          ),
        ),
      ],
    );
  }
}
