import 'package:flash_card_quiz/core/themeing/theme.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/card_container.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/card_hint_row.dart';
import 'package:flash_card_quiz/feature/ui/home_screen/widget/card_menu_button.dart';
import 'package:flutter/material.dart';

class CardFrontSide extends StatelessWidget {
  const CardFrontSide({
    super.key,
    required this.question,
    this.onMenuPressed,
  });

  final String question;
  final VoidCallback? onMenuPressed;

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      borderColor: AppColors.primary,
      child: Column(
        children: [
          CardMenuButton(onPressed: onMenuPressed),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: AppColors.onSurface,
                height: 1.4,
              ),
            ),
          ),
          const Spacer(),
          const CardHintRow(
            icon: Icons.visibility_outlined,
            text: 'Tap to show answer',
            color: AppColors.primary,
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }
}
