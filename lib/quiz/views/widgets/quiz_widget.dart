import 'package:flutter/material.dart';
import 'package:supaquiz/quiz/enums/difficulty.dart';
import 'dart:convert';
import '../../models/quiz_model.dart';

const HtmlEscape htmlEscape = HtmlEscape();

class QuizWidget extends StatelessWidget {
  const QuizWidget({super.key, required this.idx, required this.quiz});

  final int idx;
  final QuizModel quiz;
  @override
  Widget build(BuildContext context) {
    var list = quiz.incorrectAnswers;
    list.add(quiz.correctAnswer);
    var set = list.toSet();
    list = set.toList();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: Difficulty.values.byName(quiz.difficulty).color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Question ${idx + 1}",
                textScaleFactor: 2.5,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: Text(
                  (quiz.question),
                  textAlign: TextAlign.center,
                  textScaleFactor: 1.8,
                ),
              ),
              options(list),
              TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Skip this Question",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    textScaleFactor: 1.3,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

Widget options(List options) {
  options.shuffle();

  return Column(
    children: [
      OptionContainer(options[0] as String),
      OptionContainer(options[1] as String),
      OptionContainer(options[2] as String),
      OptionContainer(options[3] as String),
    ],
  );
}

Widget OptionContainer(String option) => Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color.fromARGB(255, 218, 214, 214)),
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                option,
                textScaleFactor: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
