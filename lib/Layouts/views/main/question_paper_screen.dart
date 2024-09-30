import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:focus_flow/Layouts/widgets/shimmer_loading_screen.dart';
import 'package:focus_flow/Layouts/widgets/background_view.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
import 'package:focus_flow/models/question_paper_model.dart';
import 'package:focus_flow/utils/config/load_status.dart';
import 'package:focus_flow/utils/static/app_assets.dart';
import 'package:focus_flow/utils/static/app_dimensions.dart';
import 'package:focus_flow/utils/themes/colors.dart';
import 'package:get/get.dart';
class QuestionPaperScreen extends GetView<QuestionsController> {
  QuestionPaperScreen({super.key});
  final QuestionPaperModel paper = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundView(
        showGradient: false,
        child: SafeArea(
          child: Obx(() => Stack(
            children: [
              
              Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: (){},
                          icon: SvgPicture.asset(AppAssets.menu, color: onSurfaceTextColor, width: AppDimensions.getWidth(14),height: AppDimensions.getWidth(14),))
                    ],
                  ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    width: double.infinity,
                    height: AppDimensions.getHeight(660),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topRight: Radius.circular(AppDimensions.getWidth(26)), topLeft: Radius.circular(AppDimensions.getWidth(26)))
                    ),
                    child: Column(
                      children: [
                        controller.loadStatus == LoadStatus.loading.obs ? const Expanded(child:  ShimmerLoadingScreen())
                        : Container(
                          height: AppDimensions.getHeight(500),
                          padding: EdgeInsets.only(top: AppDimensions.getHeight(34),left: AppDimensions.getWidth(22),right: AppDimensions.getWidth(22),),
                          child: PageView.builder(
                            controller: controller.pageController,
                            itemCount: paper.questionCount,
                            onPageChanged: (int page){
                              controller.currentPage.value = page;
                            },
                            itemBuilder: (context, page){
                            return Column(
                              children: [
                                Text('${paper.questions?[controller.currentPage.value].question}', style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),),
                                Column(
                                  children: List.generate(paper.questions![controller.currentPage.value].answers.length, (answer) => Container(
                                    width: double.infinity,
                                    height: AppDimensions.getHeight(70),
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(24),
                                    ),
                                    child: Text("${paper.questions![controller.currentPage.value].answers[answer]}",
                                      style: Theme.of(context).textTheme.bodyMedium,),
                                  )),
                                )

                              ],
                            );
                          }),
                        ),

                      ],
                    ),
                ),
              ),
            ],
          )),
        ),
      ),
    );
  }
}
