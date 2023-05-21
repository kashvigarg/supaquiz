import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supaquiz/api_keys.dart';
import 'package:http/http.dart' as http;
import 'package:supaquiz/quiz/enums/difficulty.dart';
import 'package:supaquiz/quiz/models/quiz_model.dart';

class QuizService {
  Future<List<QuizModel>> getQuiz(Difficulty level) async {
    final String endpoint = level.url;
    final rawdata = await http.get(Uri.parse(endpoint));

    if (rawdata.statusCode == 200) {
      final List rdata = jsonDecode(rawdata.body)["results"];
      return rdata.map(((e) => QuizModel.fromAPI(e))).toList();
    } else {
      throw Exception(rawdata.statusCode);
    }
  }
}

final apiProvider = Provider<QuizService>((ref) => QuizService());
final quizProvider =
    FutureProviderFamily<List<QuizModel>, Difficulty>((ref, level) async {
  return ref.watch(apiProvider).getQuiz(level);
});
