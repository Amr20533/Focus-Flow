import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_flow/core/controllers/auth_controller.dart';
import 'package:focus_flow/utils/static/app_assets.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/static/routes.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<AuthController> {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logoSplash, width: 200,height: 200,),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppDimensions.getHeight(50), horizontal: AppDimensions.getWidth(30)),
                child: Text("explore".tr,
                style: TextStyle(
                  color: onSurfaceTextColor,
                  fontWeight: FontWeight.bold,
                  fontSize: AppDimensions.getWidth(16),
                ),),
              ),
              GestureDetector(
                onTap: (){
                  controller.signInWithGoogle();
                },
                child: Container(
                  width: AppDimensions.getWidth(320),
                  height: AppDimensions.getWidth(60),
                  padding: EdgeInsets.symmetric(horizontal: AppDimensions.getWidth(14)),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(AppDimensions.getWidth(20)),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(AppAssets.google),
                      const Spacer(),
                      Text("sign-in".tr, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: Theme.of(context).primaryColor, fontSize: AppDimensions.getWidth(20)),),
                      const Spacer(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
