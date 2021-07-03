import 'package:flutter/material.dart';

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
        child: Text(label),
      ),
    );
  }
}
