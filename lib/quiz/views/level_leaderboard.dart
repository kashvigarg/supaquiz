import 'package:flutter/material.dart';
import 'package:supaquiz/app_constants/size_config.dart';
import 'package:supaquiz/quiz/enums/difficulty.dart';

class LevelLeaderboard extends StatelessWidget {
  const LevelLeaderboard({super.key, required this.level});

  final Difficulty level;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.purple.shade700,
      child: ListView.builder(itemBuilder: ((context, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: (index < 3)
              ? Container(
                  width: safeWidth * 0.7,
                  height: safeHeight * 0.07,
                  color: Colors.yellow,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text((index + 1).toString()),
                        Text("Username"),
                        Text("Highest Score"),
                      ],
                    ),
                  ),
                )
              : ListTile(
                  tileColor: Colors.white,
                  shape: Border.all(width: 0.4),
                  leading: Text((index + 1).toString()),
                  title: Text("Username"),
                  subtitle: Text("Highest Score"),
                ),
        );
      })),
    );
  }
}
