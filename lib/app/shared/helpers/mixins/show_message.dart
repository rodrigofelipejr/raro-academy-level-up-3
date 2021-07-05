import 'package:flutter/material.dart';
import 'package:sys_app/app/shared/helpers/helpers.dart';

import '../../widgets/widgets.dart';

enum messageType { warning, error, success }

void showMessage(
  BuildContext context, {
  required String title,
  required String message,
  String label = 'Voltar',
  bool isDismissible = true,
  void Function()? onPressed,
  messageType type = messageType.success,
}) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    isDismissible: isDismissible,
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
          color: AppColors.kWhite,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            if (type == messageType.warning)
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.kOrange3,
                size: 62.0,
              ),
            if (type == messageType.error)
              Icon(
                Icons.cancel,
                color: AppColors.kRed3,
                size: 62.0,
              ),
            if (type == messageType.success)
              Icon(
                Icons.check_circle,
                color: AppColors.kGreen3,
                size: 62.0,
              ),
            SizedBox(height: 6.0),
            Text(
              title,
              style: AppTypography.kStyleTextHeadline5,
            ),
            SizedBox(height: 14.0),
            Text(
              message,
              style: AppTypography.kStyleTextBody1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 24.0),
            ElevatedButtonWidget(
              onPressed: onPressed ?? () => Navigator.of(context).pop(),
              label: label,
            )
          ],
        ),
      );
    },
  );
}
