import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_flow/Layouts/views/quizzes/check_answer_screen.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/background_view.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/question_number_card.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/quiz_button.dart';
import 'package:focus_flow/constants.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
import 'package:focus_flow/core/extensions/question_controller_extension.dart';
import 'package:focus_flow/models/question_paper_model.dart';
import 'package:focus_flow/utils/config/answer_status.dart';
import 'package:focus_flow/utils/static/app_assets.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/static/routes.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class QuizSuccess extends GetView<QuestionsController> {
  const QuizSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: const SizedBox.shrink(),
        title: Text(controller.correctAnswers, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: onSurfaceTextColor),),
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
                        SvgPicture.asset(AppAssets.bulb, width: AppDimensions.getWidth(120), height: AppDimensions.getHeight(120),),

                        Padding(
                          padding: EdgeInsets.only(top: AppDimensions.getHeight(22),bottom: AppDimensions.getHeight(5),),
                          child: Text("congrats".tr, style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Theme.of(context).primaryColor, fontSize: 20, fontWeight: FontWeight.w700),),
                        ),
                        Text("${'got'.tr} ${controller.points} ${'pts'.tr}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor, fontSize: 14),),
                        Padding(
                          padding: EdgeInsets.only(top: AppDimensions.getHeight(22),bottom: AppDimensions.getHeight(5),),
                          child: Text("view_ans".tr, style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black, fontSize: 14),),
                        ),

                        GetBuilder<QuestionsController>(
                            id: 'user_answers',
                            builder: (quiz){
                              return Container(
                                height: AppDimensions.getHeight(65),
                                margin: EdgeInsets.only(top: AppDimensions.getHeight(26)),
                                child: ListView.builder(
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    physics: const ClampingScrollPhysics(),
                                    itemCount: controller.allQuestions.length,
                                    itemBuilder: (context, index){
                                      Questions question = controller.allQuestions[index];
                                      AnswerStatus status = AnswerStatus.none;
                                      if (question.selectedAnswer != null) {
                                        status = AnswerStatus.selected;
                                        String selectedAnswer = question.selectedAnswer!;
                                        String correctAnswer = question.correctAnswer!;

                                        if (selectedAnswer == correctAnswer) {
                                          status = AnswerStatus.correct;
                                        } else {
                                          status = AnswerStatus.wrong;
                                        }
                                      } else {
                                        status = AnswerStatus.none;
                                      }

                                      return QuestionNumberCard(
                                          onTap: (){
                                            controller.questionPage.value = index;
                                            controller.currentQuestion.value = controller.allQuestions[index];
                                            controller.jumpToQuestion(page: CheckAnswerScreen(page: index,));
                                      },
                                          answerStatus: status,
                                          number: '${index + 1}'
                                      );

                                    }),
                              );
                            }),
                        const Spacer(flex: 1,),
                        Padding(
                          padding: EdgeInsets.only(bottom: AppDimensions.getHeight(16)),
                          child: QuizButton(
                              onTap:(){
                                Get.offAllNamed(AppRoutes.home);
                              },
                              title: 'go_home'.tr),
                        ) ,

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


