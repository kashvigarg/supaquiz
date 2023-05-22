import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supaquiz/api_keys.dart';
import 'package:supaquiz/quiz/models/quiz_model.dart';
import 'package:supaquiz/quiz/views/leaderboard_view.dart';
import 'package:supaquiz/quiz/views/main_view.dart';
import 'package:supaquiz/quiz/views/quiz_view.dart';
import 'package:supaquiz/quiz/views/select_level_view.dart';
import 'package:supaquiz/quiz/views/widgets/quiz_widget.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'quiz/enums/difficulty.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: SUPABASE_URL,
    anonKey: SUPABASE_ANON_KEY,
  );

  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(scaffoldBackgroundColor: Colors.purple.shade700),
      routes: {
        "/": (context) => const MainView(),
        "level": (context) => const SelectLevelView(),
        "easy": ((context) => const QuizView(level: Difficulty.easy)),
        "medium": ((context) => const QuizView(level: Difficulty.medium)),
        "hard": ((context) => const QuizView(level: Difficulty.hard)),
      },
    );
  }
}
