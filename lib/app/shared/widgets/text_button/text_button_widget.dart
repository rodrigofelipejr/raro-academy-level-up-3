import 'package:flutter/material.dart';
import 'package:sys_app/app/shared/helpers/helpers.dart';

class TextButtonWidget extends StatelessWidget {
  final String label;
  final void Function()? onPressed;

  const TextButtonWidget({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 18.0),
        child: Text(
          label,
          style: AppTypography.kStyleLabelTextButton,
        ),
      ),
      style: TextButton.styleFrom(
        primary: AppColors.kBlue2,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
