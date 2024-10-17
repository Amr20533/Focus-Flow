import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:focus_flow/Layouts/views/main/main_screen.dart';
import 'package:focus_flow/Layouts/views/main/menu_layout.dart';
import 'package:focus_flow/core/controllers/home/zoom_controller.dart';
import 'package:focus_flow/core/controllers/language_controller.dart';
import 'package:focus_flow/core/controllers/question_papers/question_paper_controller.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class HomeLayout extends GetView<HomeZoomController> {
  HomeLayout({super.key});
  final QuestionPaperController ctrl = Get.find();
  final LanguageController languageController = Get.find<LanguageController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:Stack(
        children: [
            Container(
            decoration: BoxDecoration(
            gradient: mainGradient(context),
            ),
          ),
          Positioned(
              top: AppDimensions.getHeight(40),
              right: AppDimensions.getWidth(40),
              child: IconButton(
                onPressed: () {
                  controller.toggleDrawer();
                },
                icon: const Icon(Icons.arrow_back_ios),
                color: Colors.white,
                iconSize: AppDimensions.getWidth(20),
              )
          ),
          ZoomDrawer(
              controller: controller.zoomDrawerController,
              borderRadius: 50,
              // showShadow: true,
              isRtl: languageController.locale.languageCode.toLowerCase() == 'ar' ? true : false,
              angle: 0.0,
              style: DrawerStyle.defaultStyle,
              slideWidth: AppDimensions.getWidth(275),
              // menuBackgroundColor: Colors.white.withOpacity(0.2),
              menuScreen: const MenuLayout(),
              mainScreen:MainScreen(ctrl: ctrl)
          ),
        ],
      ),
    );
  }
}



