import 'package:flutter/material.dart';
import 'package:focus_flow/core/controllers/question_papers/question_paper_controller.dart';
import 'package:get/get.dart';

class HomeLayout extends StatelessWidget {
  HomeLayout({super.key});
  final QuestionPaperController ctrl = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Obx(() => ListView.separated(
          shrinkWrap: true,
            itemBuilder: (context,index) => Obx(() => Text(ctrl.papers.length.toString(), style: Theme.of(context).textTheme.bodyLarge,)),
            separatorBuilder: (context,index) => const SizedBox(height: 15.0,),
            itemCount: ctrl.papers.length)),
      ),
    );
  }
}
