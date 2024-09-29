import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:focus_flow/Layouts/views/main/menu_layout.dart';
import 'package:focus_flow/Layouts/widgets/home/home_header.dart';
import 'package:focus_flow/Layouts/widgets/home/home_topic_card.dart';
import 'package:focus_flow/core/controllers/home/zoom_controller.dart';
import 'package:focus_flow/core/controllers/question_papers/question_paper_controller.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class HomeLayout extends GetView<HomeZoomController> {
  HomeLayout({super.key});
  final QuestionPaperController ctrl = Get.find();
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
              angle: 0.0,
              style: DrawerStyle.defaultStyle,
              slideWidth: AppDimensions.getWidth(250),
              // drawerShadowsBackgroundColor: Colors.white.withOpacity(0.5),
              menuScreen: const MenuLayout(),
              mainScreen:Container(
                decoration: BoxDecoration(
                  gradient: mainGradient(context),
                ),
                child: SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: AppDimensions.screenHeight,
                    decoration: BoxDecoration(
                        gradient: mainGradient(context)
                    ),
                    child: Stack(
                      children: [
                        const Align(
                            alignment: Alignment.topLeft,
                            child: HomeHeader()
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            width: double.infinity,
                            height: AppDimensions.getHeight(580),
                            padding: EdgeInsets.only(left: AppDimensions.getWidth(20), right: AppDimensions.getWidth(20), top: AppDimensions.getHeight(22)),
                            margin: EdgeInsets.only(right: AppDimensions.getWidth(12), left: AppDimensions.getWidth(12), bottom: AppDimensions.getWidth(18)),
                            decoration: BoxDecoration(
                                color: customScaffoldColor(context),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(AppDimensions.getWidth(26)),topLeft: Radius.circular(AppDimensions.getWidth(26)),)
                            ),
                            child: Obx(() => ListView.separated(
                                shrinkWrap: true,
                                itemBuilder: (context,index) => Obx(() => HomeTopicCard(model: ctrl.papers[index],image: ctrl.paperImage[index],)),
                                separatorBuilder: (context,index) => const SizedBox(height: 15.0,),
                                itemCount: ctrl.papers.length
                            ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
          ),
        ],
      ),
    );
  }
}



