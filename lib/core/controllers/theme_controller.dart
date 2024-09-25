import 'package:focus_flow/utils/themes/dark_theme/dark_theme.dart';
import 'package:focus_flow/utils/themes/light_theme/light_theme.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ThemeController extends GetxController{
  late ThemeData _darkTheme;
  late ThemeData _lightTheme;

  @override
  void onInit(){
    initializedThemeData();
    super.onInit();
  }
  void initializedThemeData(){
    _darkTheme = DarkTheme().buildDarkTheme();
    _lightTheme = LightTheme().buildLightTheme();
  }
  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;
}