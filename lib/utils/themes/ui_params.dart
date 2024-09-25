import 'package:flutter/material.dart';
class UIParams{
  static bool darkMode(BuildContext context){
    return Theme.of(context).brightness == Brightness.dark;
  }
}