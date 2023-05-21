import 'package:flutter/material.dart';
import 'package:supaquiz/app_constants/size_config.dart';
import 'package:supaquiz/quiz/enums/difficulty.dart';
import 'package:supaquiz/quiz/views/select_level_view.dart';
import 'package:supaquiz/quiz/views/widgets/quiz_widget.dart';

class MainView extends StatelessWidget {
  const MainView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: BaseBackground(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text(
            "SUPABASE",
            textScaleFactor: 4,
            style: TextStyle(color: Colors.white, fontFamily: 'Minecraft'),
          ),
          Column(
            children: [
              loginContainer("LOGIN/REGISTER"),
              loginContainer("GUEST PLAYER"),
            ],
          )
        ],
      ))),
    );
  }
}

Widget loginContainer(String option) => Padding(
      padding: const EdgeInsets.all(9.0),
      child: Container(
        width: safeWidth * 0.75,
        height: safeHeight * 0.075,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white60),
        child: GestureDetector(
          onTap: () {},
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                option,
                style: TextStyle(fontFamily: 'Minecraft'),
                textScaleFactor: 1.5,
              ),
            ),
          ),
        ),
      ),
    );

class BaseBackground extends StatelessWidget {
  const BaseBackground({super.key, this.child});

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox(
        height: physicalHeight,
        child: Image.asset(
          "assets/images/mainbg.jpg",
          fit: BoxFit.fitHeight,
        ),
      ),
      Center(child: child ?? Container())
    ]);
  }
}
