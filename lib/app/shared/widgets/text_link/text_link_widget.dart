import 'package:flutter/material.dart';
import 'package:sys_app/app/shared/helpers/helpers.dart';

class TextLinkWidget extends StatelessWidget {
  final void Function() onTap;
  final String label;

  const TextLinkWidget({
    Key? key,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        label,
        style: AppTypography.kStyleTextLink,
      ),
    );
  }
}
