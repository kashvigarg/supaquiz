import 'package:flutter/material.dart';
import 'package:supaquiz/app_constants/size_config.dart';
import 'package:supaquiz/quiz/enums/difficulty.dart';
import 'package:supaquiz/quiz/views/main_view.dart';
import 'package:supaquiz/quiz/views/widgets/quiz_widget.dart';

class SelectLevelView extends StatelessWidget {
  const SelectLevelView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BaseBackground(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Select a game level",
              textScaleFactor: 2,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  levelContainer(Difficulty.easy),
                  levelContainer(Difficulty.medium),
                  levelContainer(Difficulty.hard),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget levelContainer(Difficulty difficulty) => Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        width: safeWidth * 0.9,
        height: safeHeight * 0.075,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: difficulty.color),
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                difficulty.name.toUpperCase(),
                textScaleFactor: 1.5,
              ),
            ),
          ),
        ),
      ),
    );
