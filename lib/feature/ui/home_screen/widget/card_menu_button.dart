import 'package:flash_card_quiz/core/themeing/theme.dart';
import 'package:flutter/material.dart';

class CardMenuButton extends StatelessWidget {
  const CardMenuButton({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: IconButton(
        icon: const Icon(
          Icons.more_vert,
          color: AppColors.neutralLight,
          size: 20,
        ),
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
      ),
    );
  }
}
