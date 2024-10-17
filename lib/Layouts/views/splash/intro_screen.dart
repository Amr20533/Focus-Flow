import 'package:focus_flow/Layouts/views/main/home_layout.dart';
import 'package:focus_flow/Layouts/widgets/home/circle_button.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';


class AppIntroScreen extends StatelessWidget {
  const AppIntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: mainGradient(context),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * 0.2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star, size: 65),
              const SizedBox(height: 40),
              Text("intro".tr,style: const TextStyle(color:onSurfaceTextColor,fontSize: 16, ),textAlign: TextAlign.center),
              const SizedBox(height:40.0),
              CircleButton(
                onTap:(){
                  Get.to(() => HomeLayout());
                },
                child: const Icon(Icons.arrow_forward_outlined,size: 35,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
