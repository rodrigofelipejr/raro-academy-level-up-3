import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sys_app/app/shared/helpers/helpers.dart';

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
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 58.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChange,
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: AppTypography.kStyleLabelText,
          errorMaxLines: 2,
          fillColor: AppColors.kBlue3,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
            borderSide: BorderSide(
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.kBlue2,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.kBlue2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.kRed3,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(14.0)),
            borderSide: BorderSide(
              width: 1,
              color: AppColors.kRed3,
            ),
          ),
          errorStyle: AppTypography.kStyleErrorText,
        ),
        validator: validator,
        textInputAction: textInputAction,
        obscureText: obscureText,
        keyboardType: textInputType,
        inputFormatters: textInputFormatter,
      ),
    );
  }
}
