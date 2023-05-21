import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supaquiz/quiz/models/quiz_model.dart';
import 'package:supaquiz/quiz/views/main_view.dart';
import 'package:supaquiz/quiz/views/quiz_view.dart';
import 'package:supaquiz/quiz/views/select_level_view.dart';
import 'package:supaquiz/quiz/views/widgets/quiz_widget.dart';

import 'quiz/enums/difficulty.dart';

void main() {
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: QuizView(
      level: Difficulty.hard,
    ));
  }
}
