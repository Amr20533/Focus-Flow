import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:focus_flow/core/dependencies/firebase_ref.dart';
import 'package:focus_flow/models/question_paper_model.dart';
import 'package:focus_flow/utils/config/load_status.dart';
import 'package:get/get.dart';

class QuestionsController extends GetxController{
  final loadStatus = LoadStatus.loading.obs;
  late QuestionPaperModel questionPaperModel;
  final allQuestions = <Questions>[];
  Rxn<Questions> currentQuestion = Rxn<Questions>();

  @override
  void onReady() {
    final _questionPaper = Get.arguments as QuestionPaperModel;
    debugPrint("Qest ppr Id::: ${_questionPaper.id}");
    getQuestions(_questionPaper);
    super.onReady();
  }

  Future<void> getQuestions(QuestionPaperModel paperModel) async{
    questionPaperModel = paperModel;
    loadStatus.value = LoadStatus.loading;

    try{
      final QuerySnapshot<Map<String, dynamic>> querySnapshot = await questionPaperRF.doc(paperModel.id).collection("questions").get();
      final questions = querySnapshot.docs.map((question) => Questions.fromSnapshot(question)).toList();

      paperModel.questions = questions;

      for(Questions q in paperModel.questions!){
        final QuerySnapshot<Map<String, dynamic>> answerQuery = await questionPaperRF.doc(paperModel.id).collection("questions").get();

        await questionPaperRF.doc(paperModel.id).collection("questions").doc(q.id).collection("answers").get();

        final answers = answerQuery.docs.map((answer) => Answers.fromSnapshot(answer)).toList();

        q.answers = answers;

       if(paperModel.questions != null && paperModel.questions!.isNotEmpty){
         allQuestions.addAll(paperModel.questions!);
         currentQuestion.value = paperModel.questions![0];

         if(kDebugMode){
           print(paperModel.questions![0].question);
         }
         loadStatus.value = LoadStatus.complete;

       }else{
         loadStatus.value = LoadStatus.error;
       }

      }

    }catch(e){
      if(kDebugMode){
        debugPrint("Couldn't get data --> $e");
      }

    }

  }
}