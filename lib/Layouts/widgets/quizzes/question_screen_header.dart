import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
import 'package:focus_flow/utils/static/app_assets.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/static/routes.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class QuestionScreenHeader extends StatelessWidget {
  const QuestionScreenHeader({required this.controller,super.key});
  final QuestionsController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: AppDimensions.getHeight(20), right: AppDimensions.getWidth(22), left: AppDimensions.getWidth(22)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: AppDimensions.getWidth(100),
            height: AppDimensions.getHeight(30),
            decoration: BoxDecoration(
              border: Border.all(color: onSurfaceTextColor, width: 1.5),
              borderRadius: BorderRadius.circular(AppDimensions.getWidth(16)),
            ),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.timer, color: onSurfaceTextColor,),
                Obx(() => Text(controller.quizTime.value,style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: onSurfaceTextColor),)),
              ],
            ),
          ),
          Obx(() =>Text(getValue(controller.questionPage.value + 1),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: onSurfaceTextColor),),),
          IconButton(
              onPressed: (){
                Get.toNamed(AppRoutes.completedQuiz);
              },
              icon: SvgPicture.asset(AppAssets.menu, color: onSurfaceTextColor, width: AppDimensions.getWidth(14),height: AppDimensions.getWidth(14),))
        ],
      ),
    );
  }
  String getValue(int value){
    if(value < 9 ){
      return '0$value';
    }else{
      return '$value';
    }
  }
}
