
import 'package:flutter/material.dart';

class ScoreLabel extends StatelessWidget {
  final int score;
  final String scoreOwner;

  const ScoreLabel({super.key, required this.score, required this.scoreOwner});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Pontuação $scoreOwner: $score ",
      style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 25, color: Colors.white),
    );
  }
}
