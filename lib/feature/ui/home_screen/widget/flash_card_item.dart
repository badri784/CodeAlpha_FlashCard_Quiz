import 'package:flash_card_quiz/core/model/model.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/card_front_side.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/card_back_side.dart';
import 'package:flip_card_plus/flip_card_plus.dart';
import 'package:flutter/material.dart';

class FlashCardItem extends StatelessWidget {
  const FlashCardItem({
    super.key,
    required this.quiz,
    this.onMenuPressed,
  });

  final QuizModel quiz;
  final VoidCallback? onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: FlipCardPlus(
        direction: Axis.horizontal,
        front: CardFrontSide(
          question: quiz.question,
          onMenuPressed: onMenuPressed,
        ),
        back: CardBackSide(
          answer: quiz.answer,
          onMenuPressed: onMenuPressed,
        ),
      ),
    );
  }
}
