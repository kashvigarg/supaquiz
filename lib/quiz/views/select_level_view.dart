import 'package:flutter/material.dart';
import 'package:supaquiz/app_constants/size_config.dart';
import 'package:supaquiz/quiz/enums/difficulty.dart';
import 'package:supaquiz/quiz/views/main_view.dart';
import 'package:supaquiz/quiz/views/widgets/quiz_widget.dart';

class SelectLevelView extends StatelessWidget {
  const SelectLevelView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.purple.shade700,
        actions: [
          IconButton(
              iconSize: safeWidth * 0.07,
              onPressed: () {},
              icon: const Icon(Icons.account_circle_sharp))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Let's Play",
              textScaleFactor: 2.8,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  levelContainer(Difficulty.easy, context),
                  levelContainer(Difficulty.medium, context),
                  levelContainer(Difficulty.hard, context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget levelContainer(Difficulty difficulty, BuildContext context) => Padding(
    padding: const EdgeInsets.all(9.0),
    child: Container(
      width: safeWidth * 0.9,
      height: safeHeight * 0.09,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: difficulty.secColor),
      child: GestureDetector(
        onTap: () => Navigator.of(context).pushNamed(difficulty.name),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Center(
            child: Text(
              textAlign: TextAlign.left,
              difficulty.name.toUpperCase(),
              style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'Minecraft',
                  fontWeight: FontWeight.bold),
              textScaleFactor: 2,
            ),
          ),
        ),
      ),
    ));
