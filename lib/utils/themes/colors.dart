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