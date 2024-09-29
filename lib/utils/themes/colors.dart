import 'package:flutter/material.dart';
import 'package:focus_flow/constants.dart';
import 'package:focus_flow/utils/themes/ui_params.dart';


const Color onSurfaceTextColor = Colors.white;
const mainGradientLight = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      mainColorLight,
      primaryColorLight
    ]);
const mainGradientDark = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      mainColorDark,
      primaryColorDark
    ]);
LinearGradient mainGradient(BuildContext context) => UIParams.darkMode(context) ? mainGradientDark : mainGradientLight;

Color customScaffoldColor(BuildContext context) => UIParams.darkMode(context) ? const Color(0xFF2e3c62) : const Color.fromARGB(255, 240, 237, 255);