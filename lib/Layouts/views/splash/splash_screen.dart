import 'package:flutter/material.dart';
import 'package:focus_flow/utils/static/app_assets.dart';
import 'package:focus_flow/utils/themes/colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: Image.asset(AppAssets.logoSplash, width: 200,height: 200,),
      ),
    );
  }
}
