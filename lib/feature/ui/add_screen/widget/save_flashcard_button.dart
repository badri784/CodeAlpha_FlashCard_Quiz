import 'package:flash_card_quiz/core/themeing/theme.dart';
import 'package:flutter/material.dart';

class SaveFlashcardButton extends StatelessWidget {
  const SaveFlashcardButton({super.key, this.onPressed, this.buttonText});
  final VoidCallback? onPressed;
  final String? buttonText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,
            foregroundColor: AppColors.onPrimary,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          onPressed: onPressed,
          child: Text(buttonText ?? 'Save Flashcard'),
        ),
      ),
    );
  }
}

