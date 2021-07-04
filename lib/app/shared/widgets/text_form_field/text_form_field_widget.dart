import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final String label;
  final String? Function(String? value) validator;
  final ValueChanged<String> onChange;
  final TextEditingController? controller;
  final String? initialValue;
  final bool obscureText;
  final TextInputType textInputType;
  final TextInputAction? textInputAction;
  final List<TextInputFormatter>? textInputFormatter;

  const TextFormFieldWidget({
    Key? key,
    required this.label,
    required this.validator,
    required this.onChange,
    this.controller,
    this.obscureText = false,
    this.initialValue,
    this.textInputType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.textInputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
      initialValue: initialValue,
      decoration: InputDecoration(
        labelText: label,
        errorMaxLines: 2,
      ),
      validator: validator,
      textInputAction: textInputAction,
      obscureText: obscureText,
      keyboardType: textInputType,
      inputFormatters: textInputFormatter,
    );
  }
}
