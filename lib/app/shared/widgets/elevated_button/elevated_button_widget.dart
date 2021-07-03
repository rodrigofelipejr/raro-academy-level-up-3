import 'package:flutter/material.dart';

class ElevatedButtonWidget extends StatelessWidget {
  final void Function() onPressed;
  final Widget child;

  const ElevatedButtonWidget({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: child,
    );
  }
}
