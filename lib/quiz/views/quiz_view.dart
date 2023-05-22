import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supaquiz/app_constants/size_config.dart';
import 'package:supaquiz/quiz/enums/difficulty.dart';
import 'package:supaquiz/quiz/state/providers/quiz_provider.dart';
import 'package:supaquiz/quiz/views/main_view.dart';
import 'package:supaquiz/quiz/views/widgets/quiz_widget.dart';

import '../models/quiz_model.dart';

class QuizView extends ConsumerWidget {
  const QuizView({super.key, required this.level});

  final Difficulty level;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quiz = ref.watch(quizProvider(level));
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: const BackButton(),
          title: Text(level.name.toUpperCase()),
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
        ),
        body: quiz.when(
            data: (quiz) {
              final List<QuizModel> list = quiz.map((e) => e).toList();
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomSlider(level: level),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: safeHeight * 0.7,
                      child: PageView.builder(
                          itemCount: list.length,
                          itemBuilder: ((context, index) {
                            return QuizWidget(idx: index, quiz: list[index]);
                          })),
                    ),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: Container(
                        width: safeWidth * 0.3,
                        color: Colors.green,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              "Next",
                              style: TextStyle(color: Colors.white),
                              textScaleFactor: 2,
                            ),
                          ),
                        ),
                      ))
                ],
              );
            },
            error: ((error, stackTrace) =>
                Center(child: Text(error.toString()))),
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                )));
  }
}

class CustomSlider extends StatefulWidget {
  const CustomSlider({super.key, required this.level});

  final Difficulty level;
  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: 0.3,
      backgroundColor: widget.level.color,
      valueColor: AlwaysStoppedAnimation(widget.level.secColor),
    );
  }
}
