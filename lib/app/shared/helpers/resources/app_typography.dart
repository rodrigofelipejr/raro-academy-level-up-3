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

  static TextStyle kStyleLabelTextButton = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.kBlue1,
      fontSize: 16.0,
      letterSpacing: 0.2,
    ),
  );

  static TextStyle kStyleTextBody1 = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColors.kGrey1,
      fontSize: 16.0,
    ),
  );

  static TextStyle kStyleTextLink = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.kBlue1,
      fontSize: 16.0,
    ),
  );
}
