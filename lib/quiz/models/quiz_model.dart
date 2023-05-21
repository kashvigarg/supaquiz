import 'dart:convert';

import '../enums/difficulty.dart';

class QuizModel {
  final String category;
  final String difficulty;
  final String question;
  final String correctAnswer;
  final List<dynamic> incorrectAnswers;

  QuizModel(
      {required this.category,
      required this.difficulty,
      required this.question,
      required this.correctAnswer,
      required this.incorrectAnswers});

  static QuizModel fromAPI(Map<String, dynamic> map) {
    return QuizModel(
        category: map['category'],
        difficulty: map['difficulty'],
        question: map['question'],
        correctAnswer: map['correct_answer'],
        incorrectAnswers: map['incorrect_answers']);
  }
}
