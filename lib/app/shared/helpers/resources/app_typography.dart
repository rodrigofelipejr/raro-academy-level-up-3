import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sys_app/app/shared/helpers/helpers.dart';

class AppTypography {
  static TextStyle kStyleLabelButton = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.kWhite,
      fontSize: 16.0,
      letterSpacing: 0.2,
    ),
  );
}
