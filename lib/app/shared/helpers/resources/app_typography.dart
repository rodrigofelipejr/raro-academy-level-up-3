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

  static TextStyle kStyleTextBody2 = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w500,
      color: AppColors.kGrey2,
      fontSize: 16.0,
    ),
  );

  static TextStyle kStyleTextHeadline4 = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.kGrey1,
      fontSize: 26.0,
    ),
  );

  static TextStyle kStyleTextHeadline5 = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.kGrey1,
      fontSize: 24.0,
    ),
  );

  static TextStyle kStyleTextHeadline6 = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.kGrey1,
      fontSize: 18.0,
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

  static TextStyle kStyleLabelText = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.kBlue2,
    ),
  );

  static TextStyle kStyleErrorText = GoogleFonts.getFont(
    'Source Sans Pro',
    textStyle: TextStyle(
      fontWeight: FontWeight.w600,
      color: AppColors.kRed3,
      fontSize: 13.0,
    ),
  );
}
