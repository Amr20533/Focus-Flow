import 'package:flutter/material.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/background_view.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/custom_answer_check_card.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
import 'package:focus_flow/utils/config/answer_status.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class CheckAnswerScreen extends GetView<QuestionsController> {
  const CheckAnswerScreen({required this.page,super.key});
  final int page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(Icons.arrow_back_ios, color: onSurfaceTextColor, size: AppDimensions.getWidth(16),)),
        title: Text('${'q'.tr} ${controller.questionPage}', style: Theme.of(context).textTheme.titleMedium!.copyWith(color: onSurfaceTextColor),),
      ),
      body: Container(
        width: double.infinity,
        height: AppDimensions.screenHeight,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
        ),
        child: BackgroundView(
            showGradient: false,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
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
                            id: 'user_review_answers',
                            builder: (quiz){
                              debugPrint("Quiz Answer Lengths -> ${controller.currentQuestion.value!.answers!.length}");
                              return Container(
                                height: AppDimensions.getHeight(370),
                                margin: EdgeInsets.only(top: AppDimensions.getHeight(16)),
                                child: ListView.builder(
                                  padding: EdgeInsets.zero,
                                    itemCount: controller.currentQuestion.value!.answers!.length,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    physics: const NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, int answerIndex) {

                                      final answer = controller
                                          .currentQuestion.value
                                          !.answers![answerIndex];

                                      final selectedAnswer = controller
                                          .currentQuestion.value
                                          ?.selectedAnswer;

                                      final correctAnswer = controller
                                          .currentQuestion.value
                                          ?.correctAnswer;

                                      // Initialize the status for this specific answer
                                      AnswerStatus status = AnswerStatus.none;

                                      if (selectedAnswer == correctAnswer && answer.identifier == selectedAnswer) {
                                        status = AnswerStatus.correct;
                                      }else if(selectedAnswer!.isEmpty){
                                        status = AnswerStatus.none;
                                      } else if (selectedAnswer != correctAnswer && answer.identifier == selectedAnswer) {
                                        status = AnswerStatus.wrong;
                                      } else if (answer.identifier == correctAnswer) {
                                        status = AnswerStatus.correct;
                                      }
                                      return CustomAnswerCheckCard(
                                        answerStatus: status,
                                        answer: '${answer.identifier}. ${answer.answer}',
                                      );

                                    })
                              );
                            }),

                      ],
                    ),
                  ),
                ),
              ],
            )
        ),
      ),
    );

  }
}
