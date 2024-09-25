
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:focus_flow/core/dependencies/firebase_ref.dart';
import 'package:focus_flow/core/services/firebase_storage_service.dart';
import 'package:focus_flow/models/question_paper_model.dart';
import 'package:get/get.dart';

class QuestionPaperController extends GetxController{
  final paperImage = <String>[].obs;
  final papers = <QuestionPaperModel>[].obs;
  final allQuestions = <Questions>[].obs;

  // Future<void> getAllPapers() async {
  //   try {
  //     // Fetching all question papers
  //     QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.get();
  //     debugPrint("My Data --> ${data.docs.length}");
  //
  //     final paperList = <QuestionPaperModel>[];
  //
  //     for (var paperDoc in data.docs) {
  //       debugPrint("Document ID: ${paperDoc.id} \nData: ${paperDoc.data()}");
  //
  //       // Create a QuestionPaperModel from the document snapshot
  //       var paper = QuestionPaperModel.fromSnapshot(paperDoc);
  //
  //       // Fetching questions from the sub-collection
  //       QuerySnapshot<Map<String, dynamic>> questionsData = await paperDoc.reference.collection('questions').get();
  //
  //       // Check if questions exist and map them to the model
  //       if (questionsData.docs.isNotEmpty) {
  //         paper.questions = questionsData.docs.map((questionDoc) {
  //           return Questions.fromJson(questionDoc.data());
  //         }).toList();
  //       } else {
  //         paper.questions = []; // Initialize with an empty list if no questions
  //       }
  //
  //       // Safely handle image URL fetching
  //       final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
  //       if (imgUrl != null) {
  //         paperImage.add(imgUrl);
  //       } else {
  //         debugPrint("Image URL for ${paper.title} is null.");
  //       }
  //
  //       paperList.add(paper);
  //     }
  //
  //     papers.assignAll(paperList);
  //     debugPrint("Got All image URLs: ${paperImage.length}");
  //   } catch (e) {
  //     debugPrint("getAllPapers error state called!!!!!!!!!!!! \n ${e.toString()}");
  //   }
  // }

  Future<void> getAllQuestions() async {
    try {
      // Fetching all question papers
      QuerySnapshot<Map<String, dynamic>> papersData = await questionPaperRF.get();
      debugPrint("Number of papers: ${papersData.docs.length}");


      for (var paperDoc in papersData.docs) {
        debugPrint("Document ID: ${paperDoc.id} \nData: ${paperDoc.data()}");

        // Fetching questions from the sub-collection
        QuerySnapshot<Map<String, dynamic>> questionsData = await paperDoc.reference.collection('questions').get();

        // Map questions to the model
        if (questionsData.docs.isNotEmpty) {
          final questions = questionsData.docs.map((questionDoc) {
            return Questions.fromJson(questionDoc.data());
          }).toList();

          allQuestions.addAll(questions);
        }
      }

      // Process the collected questions as needed
      debugPrint("Total Questions Collected: ${allQuestions.length}");
      // You can assign these questions to a variable or perform other operations

    } catch (e) {
      debugPrint("getAllQuestions error state called!!!!!!!!!!!! \n ${e.toString()}");
    }
  }

  // Future<void> getAllPapers() async {
  //   try {
  //     List<String> imgName = [ 'biology', 'chemistry', 'maths', 'physics',];
  //     for (var img in imgName){
  //       final imgUrl = await Get.find<FirebaseStorageService>().getImage(img);
  //       paperImage.add(imgUrl!);
  //     }
  //
  //
  //     debugPrint("got All image Urls ^^ \n ${paperImage.length}");
  //   } catch (e) {
  //     debugPrint("getAllPapers error state called!!!!!!!!!!!! \n ${e.toString()}");
  //   }
  // }
  //

  Future<void> getAllPapers() async{
    // List<String> imgName = [ 'biology', 'chemistry', 'maths', 'physics',];
    try{
      // get everything from our firebase storage --> get the data from the collection [questionPapers]
      QuerySnapshot<Map<String,dynamic>> data = await questionPaperRF.get();
      final paperList = <QuestionPaperModel>[];

      for (var paper in data.docs) {
        try {
          paperList.add(QuestionPaperModel.fromSnapshot(paper));
        } catch (e) {
          debugPrint("Error parsing paper ${paper.id}: ${e.toString()}");
        }
      }

      papers.assignAll(paperList);
        for(var paper in paperList){
          final imgUrl = await Get.find<FirebaseStorageService>().getImage(paper.title);
          paperImage.add(imgUrl!);
        }
      debugPrint("got All Papers^^ \n ${papers.length}");
      debugPrint("got All image Urls ^^ \n ${paperImage.length}");

        // papers.assignAll(paperList);
    }catch(e){
      debugPrint("getAllPapers error state called!!!!!!!!!!!! \n ${e.toString()}");
    }
  }


  Future<void> findMissingQuestions() async {
    QuerySnapshot<Map<String, dynamic>> data = await questionPaperRF.where("questions", isNull: true).get();
    for (var doc in data.docs) {
      debugPrint("Document without questions: ${doc.id}");
    }
  }

  @override
  void onReady(){
    getAllPapers();
    super.onReady();
  }
}