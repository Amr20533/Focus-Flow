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
  int _remainingSeconds = 1;

  int get remainingSeconds => _remainingSeconds;

  final quizTime = "00:00".obs;
  Timer? timer;

  PageController pageController = PageController();
  RxInt questionPage = 0.obs;
  // RxInt selectedAnswer = 0.obs;

  bool get isFirstQues => questionPage.value > 0;

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
  }


  set seconds(int newSeconds){
    _remainingSeconds = newSeconds;
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
        final answers = q.answers!.map((answer) => Answers.fromJson(answer.toJson())).toList();
        q.answers = answers;
      }

      if (paperModel.questions != null && paperModel.questions!.isNotEmpty) {
        allQuestions.addAll(paperModel.questions!);
        currentQuestion.value = paperModel.questions![0];
        _startTime(paperModel.timeSeconds);
        loadStatus.value = LoadStatus.complete;

        if (kDebugMode) {
          print(questions.first.question);
          print('Answers Length --> ${questions[0].answers?.length}');
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

  void selectedAnswer(String? answer){
    currentQuestion.value!.selectedAnswer = answer;
    update(['user_answers']);
  }

  void nextQuestion(){
    if(questionPage.value >= allQuestions.length - 1){
      return;
    }
    questionPage.value ++;
    currentQuestion.value = allQuestions[questionPage.value];
    update();
    debugPrint('${currentQuestion.value}');
  }
  void previousQuestion(){
    if(questionPage.value <= 0){
      return;
    }
    questionPage.value --;
    currentQuestion.value = allQuestions[questionPage.value];
    update();
  }

  _startTime(int seconds){
    const duration = Duration(seconds: 1);
    _remainingSeconds = seconds;
    timer = Timer.periodic(duration, (Timer t) {
      if (_remainingSeconds > 0) {
        int minutes = _remainingSeconds ~/ 60;
        int secs = _remainingSeconds  % 60;
        quizTime.value = "${minutes.toString().padLeft(2, "0")}:${secs.toString().padLeft(2, "0")}";
        _remainingSeconds --;
      } else {
        quizTime.value = "00:00";
        timer!.cancel();
      }
    });  }



  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

}
