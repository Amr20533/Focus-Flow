import 'package:flutter/material.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';

double _cardBorderRadius = AppDimensions.getWidth(12.0);

class UIParams{
  static BorderRadius get cardBorderRadius => BorderRadius.circular(_cardBorderRadius);

  static bool darkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}