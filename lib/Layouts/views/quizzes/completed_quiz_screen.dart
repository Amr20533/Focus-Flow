import 'package:flutter/material.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/background_view.dart';
import 'package:focus_flow/Layouts/widgets/quizzes/quiz_button.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';

class CompletedQuizScreen extends GetView<QuestionsController> {
  const CompletedQuizScreen({super.key});

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
        title: Text(controller.completeQuiz, style: Theme.of(context).textTheme.titleMedium!.copyWith(color: onSurfaceTextColor),),
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

                      Row(
                        children: [
                          Icon(Icons.timer, color: Theme.of(context).primaryColor,),
                          const SizedBox(width: 8),
                          Text("${controller.remainingSeconds} ${'rem'.tr}", style: Theme.of(context).textTheme.bodyMedium!.copyWith(color: Theme.of(context).primaryColor, fontSize: 15, fontWeight: FontWeight.w600),),
                        ],
                      ),
                      GetBuilder<QuestionsController>(
                          id: 'user_answers',
                          builder: (quiz){
                            return Container(
                              height: AppDimensions.getHeight(460),
                              margin: EdgeInsets.only(top: AppDimensions.getHeight(26)),
                              child: GridView.builder(
                                padding: EdgeInsets.zero,
                                  itemCount: controller.allQuestions.length,
                                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: AppDimensions.screenWidth ~/75,
                                      crossAxisSpacing: AppDimensions.getWidth(8),
                                      mainAxisSpacing: AppDimensions.getHeight(8),
                                  ),
                                  itemBuilder: (context, index){
                                    bool answered = controller.allQuestions[index].selectedAnswer!.isNotEmpty;

                                    return Container(
                                      width: AppDimensions.getWidth(60),
                                      height: AppDimensions.getHeight(60),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: answered ? Theme.of(context).primaryColor : Theme.of(context).primaryColor.withOpacity(0.1),
                                          borderRadius: BorderRadius.circular(AppDimensions.getWidth(10))
                                      ),
                                      child: Text('${index + 1}', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white),),
                                    );
                                  }),
                            );
                          }),
                      const Spacer(flex: 1,),
                      Padding(
                        padding: EdgeInsets.only(bottom: AppDimensions.getHeight(16)),
                        child: QuizButton(
                            onTap:(){
                              controller.complete();
                            },
                            title: 'complete'.tr),
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
