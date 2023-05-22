import 'package:flutter/material.dart';
import 'package:supaquiz/quiz/enums/difficulty.dart';
import 'package:supaquiz/quiz/views/level_leaderboard.dart';

class LeaderboardView extends StatelessWidget {
  const LeaderboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.purple.shade700,
        appBar: AppBar(
            centerTitle: true,
            foregroundColor: Colors.white,
            title: const Text(
              "Leaderboard",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: const BackButton(),
            backgroundColor: Colors.transparent,
            elevation: 0,
            bottom: const TabBar(tabs: tabs)),
        body: const TabBarView(children: tabPages),
      ),
    );
  }
}

const tabPages = [
  LevelLeaderboard(level: Difficulty.easy),
  LevelLeaderboard(level: Difficulty.medium),
  LevelLeaderboard(level: Difficulty.hard),
  LevelLeaderboard(level: Difficulty.easy)
];
const tabs = [
  Tab(
    text: "All",
  ),
  Tab(
    text: "Easy",
  ),
  Tab(
    text: "Medium",
  ),
  Tab(
    text: "Hard",
  ),
];
