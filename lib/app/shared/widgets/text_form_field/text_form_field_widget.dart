import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType textInputType;
  final String label;
  final ValueChanged<String> onChange;
  final TextInputAction? textInputAction;
  final bool obscureText;
  final String? Function(String? value) validator;
  final List<TextInputFormatter>? textInputFormatter;

  const TextFormFieldWidget({
    Key? key,
    this.controller,
    this.textInputType = TextInputType.text,
    required this.label,
    required this.validator,
    required this.onChange,
    this.textInputAction = TextInputAction.next,
    this.obscureText = false,
    this.textInputFormatter,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChange,
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
