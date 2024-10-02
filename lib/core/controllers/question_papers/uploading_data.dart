import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:focus_flow/core/dependencies/firebase_ref.dart';
import 'package:focus_flow/models/question_paper_model.dart';
import 'package:focus_flow/utils/config/load_status.dart';
import 'package:get/get.dart';

class UploadingData extends GetxController {
  final loadingStatus = LoadStatus.loading.obs;

  @override
  void onReady() {
    super.onReady();
    uploadData();
  }

  Future<void> uploadData() async {
    loadingStatus.value = LoadStatus.loading;
    try {
      final fireStore = FirebaseFirestore.instance;
      final manifestContent = await DefaultAssetBundle.of(Get.context!).loadString("AssetManifest.json");
      final Map<String, dynamic> manifestMap = json.decode(manifestContent);

      // Load JSON files and print paths
      final assetsPapers = manifestMap.keys.where((path) => path.startsWith("assets/DB/paper") && path.endsWith(".json")).toList();
      print(assetsPapers);

      List<QuestionPaperModel> questionPapers = [];
      for (var paper in assetsPapers) {
        String paperContent = await rootBundle.loadString(paper);
        questionPapers.add(QuestionPaperModel.fromJson(json.decode(paperContent)));
      }

      print("Items number: ${questionPapers.length}");

      var batch = fireStore.batch();
      for (var paper in questionPapers) {
        // Create the main paper document
        DocumentReference paperRef = questionPaperRF.doc(paper.id);
        batch.set(paperRef, {
          "title": paper.title,
          "image_url": paper.imageUrl,
          "time_seconds": paper.timeSeconds,
          "Description": paper.description,
          "questions_count": paper.questions?.length ?? 0,
          // Include the questions field as an array if necessary
          "questions": paper.questions?.map((q) => q.toJson()).toList()
        });

        for (var question in paper.questions!) {
          final questionPath = questionReference(paperId: paper.id, questionId: question.id);
          batch.set(questionPath, {
            'question': question.question,
            'correct_answer': question.correctAnswer,
            'selected_answer': '',
            'answers': question.answers?.map((a) => {
              'identifier': a.identifier,
              'answer': a.answer,
            }).toList() ?? [],
          });
        }
      }

      await batch.commit();
      loadingStatus.value = LoadStatus.complete;
      print("Data uploaded successfully.");
    } catch (e) {
      loadingStatus.value = LoadStatus.error;
      print("Error uploading data: $e");
    }
  }
}

