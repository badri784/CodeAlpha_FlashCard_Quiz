import 'package:flash_card_quiz/core/themeing/theme.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/card_container.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/card_hint_row.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/card_menu_button.dart';
import 'package:flutter/material.dart';

class CardBackSide extends StatelessWidget {
  const CardBackSide({
    super.key,
    required this.answer,
    this.onMenuPressed,
  });

  final String answer;
  final VoidCallback? onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      borderColor: AppColors.secondary,
      child: Column(
        children: [
          CardMenuButton(onPressed: onMenuPressed),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              answer,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: AppColors.secondaryDark,
                height: 1.4,
              ),
            ),
          ),
          const Spacer(),
          const CardHintRow(
            icon: Icons.flip,
            text: 'Tap to show question',
            color: AppColors.secondary,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
