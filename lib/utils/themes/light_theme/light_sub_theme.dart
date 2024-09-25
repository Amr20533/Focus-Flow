import 'package:flutter/material.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:google_fonts/google_fonts.dart';

mixin SubThemeData{
  TextTheme getTextThemes(){
    return GoogleFonts.quicksandTextTheme(
        const TextTheme(
            bodyLarge:  TextStyle(fontWeight: FontWeight.w400),
            bodyMedium: TextStyle(fontWeight: FontWeight.w400)
        )
    );
  }
  IconThemeData getIconTheme(){
    return const IconThemeData(color: onSurfaceTextColor,size: 16);
  }
}