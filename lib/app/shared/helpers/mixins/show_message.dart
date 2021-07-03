import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

void showMessage(BuildContext context, {required String message}) {
  showModalBottomSheet(
    context: context,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text('Erro ao fazer login'),
          Text(message),
          ElevatedButtonWidget(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('Voltar'),
          )
        ],
      );
    },
  );
}
