import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:focus_flow/core/dependencies/firebase_ref.dart';
import 'package:focus_flow/models/question_paper_model.dart';
import 'package:focus_flow/utils/config/load_status.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController {
  final loadStatus = LoadStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  Rxn<Questions> currentQuestion = Rxn<Questions>();
  int _seconds = 0;

  int get seconds => _seconds;

  late Timer timer;

  PageController pageController = PageController();
  RxInt currentPage = 0.obs;

  @override
  void onReady() {
    super.onReady();
    final arguments = Get.arguments;
    if (arguments is QuestionPaperModel) {
      debugPrint("Question ppr Id::: ${arguments.id}");
      getQuestions(arguments);
    } else {
      debugPrint("Error: No valid QuestionPaperModel provided.");
      loadStatus.value = LoadStatus.error;
    }
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (_seconds > 0) {
        _seconds--;
        update();
      } else {
        timer.cancel();
      }
    });
  }


  set seconds(int newSeconds){
    _seconds = newSeconds;
    update();
  }

  Future<void> getQuestions(QuestionPaperModel paperModel) async {
    questionPaperModel = paperModel;
    loadStatus.value = LoadStatus.loading;

    try {
      // Fetch questions
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await questionPaperRF
          .doc(paperModel.id)
          .collection("questions")
          .get();

      final questions = querySnapshot.docs.map((question) => Questions.fromSnapshot(question)).toList();
      paperModel.questions = questions;

      // Fetch all answers for the questions in one go
      for (Questions q in questions) {
        final answerQuery = await questionPaperRF
            .doc(paperModel.id)
            .collection("questions")
            .doc(q.id)
            .collection("answers")
            .get();

        final answers = answerQuery.docs.map((answer) => Answers.fromSnapshot(answer)).toList();
        q.answers = answers; // Assign fetched answers to the question
      }

      if (questions.isNotEmpty) {
        allQuestions.addAll(questions);
        currentQuestion.value = questions.first;
        loadStatus.value = LoadStatus.complete;

        if (kDebugMode) {
          print(questions.first.question);
        }
      } else {
        loadStatus.value = LoadStatus.error;
      }

    } catch (e) {
      if (kDebugMode) {
        debugPrint("Couldn't get data --> $e");
      }
      loadStatus.value = LoadStatus.error;
    }
  }

  void nextPage(){
    if(currentPage.value < questionPaperModel.questionCount){
      currentPage.value ++;
      pageController.animateToPage(currentPage.value,
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      );
    }
  }

  void previousPage(){
    if(currentPage.value < 0){
      currentPage.value --;
      pageController.previousPage(
      curve: Curves.linear,
      duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

}
