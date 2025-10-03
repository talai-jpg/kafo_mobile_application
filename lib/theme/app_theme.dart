import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kafo_app/app_color.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // app font defult type
    fontFamily: GoogleFonts.roboto().fontFamily,

    // Elvated button style
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary_400,
        foregroundColor: AppColor.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: TextStyle(
          color: AppColor.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),

    // Text style
    textTheme: ThemeData.light().textTheme.copyWith(
      headlineLarge: GoogleFonts.changa(
        fontSize: 48,
        fontWeight: FontWeight.bold,
        color: AppColor.black,
      ),

      headlineMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: AppColor.black,
      ),

      titleLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColor.white,
      ),
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),

      titleSmall: TextStyle(fontSize: 12, color: AppColor.black),
    ),

    //Text buttton Style
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: AppColor.black,
        textStyle: TextStyle(
          color: AppColor.black,
          fontWeight: FontWeight.bold,
          decoration: TextDecoration.underline,
        ),
      ),
    ),

    // checkbox style
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.all(AppColor.secondary_100),
      checkColor: WidgetStateProperty.all(AppColor.primary_400),
      side: BorderSide(color: AppColor.primary_400),
    ),
  );
}
