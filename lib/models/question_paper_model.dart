import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionPaperModel {
  QuestionPaperModel({
    required this.id,
    required this.title,
    this.imageUrl,
    required this.description,
    required this.timeSeconds,
    required this.questionCount,
    this.questions,
  });

  String id;
  String title;
  String? imageUrl;
  String description;
  int timeSeconds;
  List<Questions>? questions;
  int questionCount;

  // JSON constructor
  QuestionPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['Description'],
        timeSeconds = json['time_seconds'],
        questionCount = json['question_counts'] ?? 0,
        questions = (json['questions'] as List<dynamic>?)
            ?.map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  // Snapshot constructor
  QuestionPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'] ?? '',
        imageUrl = json['image_url'],
        description = json['Description'] ?? '',
        timeSeconds = json['time_seconds'] ?? 0,
        questionCount = (json['questions_count'] ?? 0),
        questions = (json['questions'] as List<dynamic>?)
            ?.map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList() ?? []; // Handle missing questions


  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['image_url'] = imageUrl;
    _data['Description'] = description;
    _data['time_seconds'] = timeSeconds;
    _data['question_counts'] = questions?.length ?? 0;
    if (questions != null) {
      _data['questions'] = questions!.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Questions {
  Questions({
    required this.id,
    required this.question,
    required this.answers,
    this.selectedAnswer,
    this.correctAnswer,
  });

  String id;
  String question;
  List<Answers>? answers;
  String? selectedAnswer;
  String? correctAnswer;

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        question = json['question'],
        answers = (json['answers'] as List<dynamic>?)
            ?.map((dynamic e) => Answers.fromJson(e as Map<String, dynamic>))
            .toList() ?? [],
        selectedAnswer = json['selected_answer'],
        correctAnswer = json['correct_answer'];

  Questions.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        question = json['question'],
        selectedAnswer = json['selected_answer'],
        correctAnswer = json['correct_answer'],
        answers = (json['answers'] as List<dynamic>?)
            ?.map((e) => Answers.fromJson(e as Map<String, dynamic>))
            .toList() ?? [];



  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['question'] = question;
    if (answers != null) {
      _data['answers'] = answers!.map((e) => e.toJson()).toList();
    }
    _data['selected_answer'] = selectedAnswer;
    _data['correct_answer'] = correctAnswer;
    return _data;
  }
}

class Answers {
  Answers({
    this.identifier,
    this.answer,
  });

  String? identifier;
  String? answer;

  Answers.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'],
        answer = json['answer'];


  Answers.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : identifier = json['identifier'],
        answer = json['answer'];

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['identifier'] = identifier;
    _data['answer'] = answer;
    return _data;
  }
}
