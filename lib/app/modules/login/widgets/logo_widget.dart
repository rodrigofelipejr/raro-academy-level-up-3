import 'package:flutter/material.dart';
import 'package:sys_app/app/shared/helpers/helpers.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: 100.0,
      child: Align(
        alignment: Alignment.center,
        child: Image.asset(
          AppImages.logoBlue,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
