import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
                children: [
                  // Slider(value: 0, onChanged: ((value) {})),
                  CustomSlider(level: level),
                  Expanded(
                    child: PageView.builder(
                        itemCount: list.length,
                        itemBuilder: ((context, index) {
                          return QuizWidget(idx: index, quiz: list[index]);
                        })),
                  ),
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
  double _value = 0;
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 10.0,
        trackShape: const RoundedRectSliderTrackShape(),
        activeTrackColor: Colors.black,
        inactiveTrackColor: widget.level.color,
        thumbColor: widget.level.secColor,
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 32.0),
        tickMarkShape: const RoundSliderTickMarkShape(),
        activeTickMarkColor: widget.level.secColor,
        inactiveTickMarkColor: Colors.white,
      ),
      child: Slider(
        min: 0.0,
        max: 100.0,
        value: _value,
        divisions: 9,
        label: '${(_value / 10).round()}',
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
      ),
    );
  }
}
