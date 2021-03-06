import 'package:flutter/material.dart';

import '../../../shared/widgets/widgets.dart';
import '../../../shared/helpers/helpers.dart';

class CreateAccountWidget extends StatelessWidget {
  const CreateAccountWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 14.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 4.0),
            child: Text(
              'Ainda não possui conta?',
              style: AppTypography.kStyleTextBody1,
            ),
          ),
          TextLinkWidget(
            onTap: () => Navigator.of(context).pushNamed(AppRoutes.createAccount),
            label: 'Crie uma nova.',
          ),
        ],
      ),
    );
  }
}
