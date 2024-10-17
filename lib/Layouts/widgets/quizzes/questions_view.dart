import 'package:flutter/material.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/custom_answer_card.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/question_screen_bottom_bar.dart';
import 'package:get/get.dart';

class QuestionsView extends StatelessWidget {
  const QuestionsView({
    super.key,
    required this.controller,
  });

  final QuestionsController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: AppDimensions.getHeight(660),
      padding: EdgeInsets.only(top: AppDimensions.getHeight(34),left: AppDimensions.getWidth(22),right: AppDimensions.getWidth(22),),
      decoration: BoxDecoration(
          color: customScaffoldColor(context),
          borderRadius: BorderRadius.only(topRight: Radius.circular(AppDimensions.getWidth(26)), topLeft: Radius.circular(AppDimensions.getWidth(26)))
      ),
      child: Column(
        children: [

          Text(controller.currentQuestion.value!.question, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
          GetBuilder<QuestionsController>(
              id: 'user_answers',
              builder: (quiz){
                return SizedBox(
                  height: AppDimensions.getHeight(340),
                  child: ListView.builder(
                      itemCount: controller.currentQuestion.value!.answers!.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, int answer){
                        final userAnswer = controller.currentQuestion.value!.answers![answer];
                        final selectedAnswer = controller.currentQuestion.value!.selectedAnswer;
                        return CustomAnswerCard(
                            onTap:(){
                              controller.selectedAnswer(userAnswer.identifier);
                            },
                            isSelected: userAnswer.identifier == selectedAnswer ? true : false,
                            answer: '${userAnswer.identifier}. ${userAnswer.answer}'
                        );
                      }),
                );
              }),
          const Spacer(flex: 1,),
          QuestionScreenBottomBar(controller: controller,),

        ],
      ),
    );
  }
}
