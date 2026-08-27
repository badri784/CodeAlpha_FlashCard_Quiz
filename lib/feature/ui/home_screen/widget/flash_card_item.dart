import 'package:flash_card_quiz/core/themeing/theme.dart';
import 'package:flash_card_quiz/core/model/model.dart';
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
        front: _buildFront(),
        back: _buildBack(),
      ),
    );
  }

  // ── Front side: Question ──
  Widget _buildFront() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(14),
        border: const Border(
          left: BorderSide(color: AppColors.primary, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 8, 16),
        child: Column(
          children: [
            // ── 3-dot menu ──
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.neutralLight,
                  size: 20,
                ),
                onPressed: onMenuPressed,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),

            const Spacer(),

            // ── Question text ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                quiz.question,
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

            // ── Show Answer hint ──
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.visibility_outlined,
                  size: 18,
                  color: AppColors.primary,
                ),
                SizedBox(width: 6),
                Text(
                  'Tap to show answer',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }

  // ── Back side: Answer ──
  Widget _buildBack() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surfaceWhite,
        borderRadius: BorderRadius.circular(14),
        border: const Border(
          left: BorderSide(color: AppColors.secondary, width: 4),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.neutral.withValues(alpha: 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 8, 16),
        child: Column(
          children: [
            // ── 3-dot menu ──
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: AppColors.neutralLight,
                  size: 20,
                ),
                onPressed: onMenuPressed,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ),

            const Spacer(),

            // ── Answer text ──
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                quiz.answer,
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

            // ── Tap to flip back hint ──
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.flip,
                  size: 18,
                  color: AppColors.secondary,
                ),
                SizedBox(width: 6),
                Text(
                  'Tap to show question',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: AppColors.secondary,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
