import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:supaquiz/api_keys.dart';

enum Difficulty {
  easy(easyUrl, Colors.greenAccent, Colors.green),
  medium(mediumUrl, Colors.purple, Colors.deepPurple),
  hard(hardUrl, Colors.red, Colors.black);

  const Difficulty(this.url, this.color, this.secColor);
  final Color color;
  final Color secColor;
  final String url;

  Difficulty fromName(String name) => Difficulty.values.byName(name);
}
