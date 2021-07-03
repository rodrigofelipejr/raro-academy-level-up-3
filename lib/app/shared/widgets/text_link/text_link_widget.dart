import 'package:flutter/material.dart';

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
      onTap: () {},
      child: Text(label),
    );
  }
}
