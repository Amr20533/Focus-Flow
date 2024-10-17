import 'package:flutter/material.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/prev_question_button.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/quiz_button.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/static/routes.dart';
import 'package:get/get.dart';

class QuestionScreenBottomBar extends StatelessWidget {
  const QuestionScreenBottomBar({required this.controller,super.key});
  final QuestionsController controller;

  @override
  Widget build(BuildContext context) {
    return controller.questionPage.value <= 0 ? Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.getHeight(16)),
      child: QuizButton(
          onTap:(){
            controller.nextQuestion();
          },
          title: 'next'.tr),
    ) : Padding(
      padding: EdgeInsets.only(bottom: AppDimensions.getHeight(16)),
      child: Row(
        children: [

          Expanded(
            flex: 1,
            child: PrevQuestionButton(
              onTap:(){
                controller.previousQuestion();
              },
            ),
          ),
          SizedBox(width: AppDimensions.getWidth(12)),
          Expanded(
            flex: 4,
            child: QuizButton(
                onTap:(){
                  if(controller.isLastQuestion){
                    Get.toNamed(AppRoutes.completedQuiz);

                  }else{
                    controller.nextQuestion();
                  }
                },
                title: 'next'.tr),
          ),
        ],
      ),
    );
  }
}
