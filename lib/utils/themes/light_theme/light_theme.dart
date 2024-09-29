import 'package:flutter/material.dart';
import 'package:focus_flow/constants.dart';
import 'package:focus_flow/utils/themes/light_theme/light_sub_theme.dart';

class LightTheme with SubThemeData{
  buildLightTheme(){
    final ThemeData systemLightTheme = ThemeData.light();
    return systemLightTheme.copyWith(iconTheme: getIconTheme(),
        primaryColor: primaryColorLight,
        cardColor: primaryColorDark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: getTextThemes().apply(
            bodyColor: mainTextColor,
            displayColor: mainTextColor
        ));
  }
}