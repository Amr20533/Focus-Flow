import 'package:flutter/material.dart';
import 'package:focus_flow/Layouts/views/main/shimmer_loading_screen.dart';
import 'package:focus_flow/Layouts/widgets/background_view.dart';
import 'package:focus_flow/core/controllers/question_papers/question_paper_controller.dart';
import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';
import 'package:focus_flow/utils/config/load_status.dart';
import 'package:get/get.dart';
class QuestionPaperScreen extends GetView<QuestionsController> {
  const QuestionPaperScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundView(
        showGradient: false,
        child: Obx(() => Container(
                child: Column(
                  children: [
                    if(controller.loadStatus == LoadStatus.loading.obs)
                      const Expanded(child:  ShimmerLoadingScreen()),
                  ],
                ),
        )),
      ),
    );
  }
}
