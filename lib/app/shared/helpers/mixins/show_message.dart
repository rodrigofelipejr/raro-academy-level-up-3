import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

void showMessage(
  BuildContext context, {
  required String title,
  required String message,
  String label = 'Voltar',
  bool isDismissible = true,
  void Function()? onPressed,
}) {
  showModalBottomSheet(
    context: context,
    isDismissible: isDismissible,
    builder: (context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(title),
          Text(message),
          ElevatedButtonWidget(
            onPressed: onPressed ?? () => Navigator.of(context).pop(),
            child: Text(label),
          )
        ],
      );
    },
  );
}
