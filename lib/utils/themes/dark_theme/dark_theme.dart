import 'package:flutter/material.dart';
import 'package:focus_flow/utils/themes/light_theme/light_sub_theme.dart';

class DarkTheme with SubThemeData{
  ThemeData buildDarkTheme(){
    final ThemeData systemDarkTheme = ThemeData.dark();
    return systemDarkTheme.copyWith(
        iconTheme: getIconTheme(),
        textTheme: getTextThemes().apply(
            bodyColor: Colors.white,
            displayColor: Colors.white
        )
    );
  }
}