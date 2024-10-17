


import 'package:focus_flow/core/controllers/question_papers/questions_controller.dart';

extension QuestionControllerExtension on QuestionsController{

  int get correctAnswers => allQuestions.where((correctAnswers) => correctAnswers.selectedAnswer == correctAnswers.correctAnswer).toList().length;


  String get points{
    var point = (correctAnswers/allQuestions.length) * 100 * (questionPaperModel.timeSeconds - remainingSeconds) / questionPaperModel.timeSeconds * 100;
    return point.toStringAsFixed(2);
  }
}