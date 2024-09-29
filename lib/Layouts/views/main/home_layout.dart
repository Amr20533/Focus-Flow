import 'package:flutter/material.dart';
import 'package:focus_flow/Layouts/widgets/home/home_header.dart';
import 'package:focus_flow/Layouts/widgets/home/home_topic_card.dart';
import 'package:focus_flow/constants.dart';
import 'package:focus_flow/core/controllers/question_papers/question_paper_controller.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/static/routes.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  final QuestionPaperController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:SafeArea(
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
                      itemBuilder: (context,index) => Obx(() => GestureDetector(
                        onTap: (){
                          Get.toNamed(AppRoutes.questionScreen);
                        },
                        child: HomeTopicCard(model: ctrl.papers[index],image: ctrl.paperImage[index],),
                      )),
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
    );
  }
}



