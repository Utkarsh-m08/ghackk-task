import 'package:flutter/material.dart';
import 'package:ghackk/styles/screen_utils.dart';
import 'package:google_fonts/google_fonts.dart';

class AppColors {
  /// Common
  final Color primaryColour = const Color(0xFFF5BE00);
  final Color secondaryColour = const Color(0xFFF5E6CC);
  final Color accentColour = const Color(0xFF043142);
  final Color backgroundColour = const Color(0xFFFFFFFF);
  final Color textColourDark = const Color(0xFF333333);
  final Color textColourlight = const Color(0xFF999999);
}

class AppTextStyles {
  static TextStyle headline(
    BuildContext context,
    double? customFontSize,
    Color? customColour,
    double? textHeight,
  ) {
    // if custom font size
    final screenUtil = ScreenUtils(context);
    double fontSize = customFontSize ?? screenUtil.responsiveFontSize(0.05);
    Color color = customColour ?? AppColors().accentColour;
    double height = textHeight ?? 1.0;
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
    );
  }

  static TextStyle headlineItalics(
    BuildContext context,
    double? customFontSize,
    Color? customColour,
    double? textHeight,
  ) {
    // if custom font size
    final screenUtil = ScreenUtils(context);
    double fontSize = customFontSize ?? screenUtil.responsiveFontSize(0.06);
    Color color = customColour ?? AppColors().accentColour;
    double height = textHeight ?? 1.0;
    return GoogleFonts.poppins(
      fontSize: fontSize,
      fontWeight: FontWeight.bold,
      color: color,
      height: height,
      fontStyle: FontStyle.italic,
    );
  }

  static TextStyle body(
      BuildContext context, double? customFontSize, Color? customColour) {
    // if custom font there then use nahi toh default
    final screenUtil = ScreenUtils(context);
    double fontSize = customFontSize ?? screenUtil.responsiveFontSize(0.045);
    Color color = customColour ?? AppColors().accentColour;
    return GoogleFonts.poppins(
      fontSize: fontSize,
      // fontWeight: FontWeight.bold,
      color: color,
    );
  }
}
