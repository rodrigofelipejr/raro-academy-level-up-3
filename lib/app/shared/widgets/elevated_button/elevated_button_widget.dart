import 'package:flutter/material.dart';

import '../../helpers/helpers.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final String label;

  const ElevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.0,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(label, style: AppTypography.kStyleLabelButton),
        style: ElevatedButton.styleFrom(
          primary: AppColors.kBlue1,
          onPrimary: AppColors.kWhite,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 0,
        ),
      ),
    );
  }
}
