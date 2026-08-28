import 'package:flash_card_quiz/core/model/model.dart';
import 'package:flash_card_quiz/core/state_mangment/cubit/new_card_cubit.dart';
import 'package:flash_card_quiz/core/themeing/theme.dart';
import 'package:flash_card_quiz/feature/ui/add_screen/create_new_card_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void showCardOptionsBottomSheet(
  BuildContext context, {
  required QuizModel quiz,
  required int index,
}) {
  final cubit = context.read<NewCardCubit>();

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (bottomSheetContext) {
      return Container(
        decoration: const BoxDecoration(
          color: AppColors.surfaceWhite,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Handle bar ──
                Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.neutralLight.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                const SizedBox(height: 20),

                // ── Title ──
                const Text(
                  'Card Options',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: AppColors.onSurface,
                  ),
                ),
                const SizedBox(height: 16),

                const Divider(height: 1, color: AppColors.surface),

                // ── Edit option ──
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.edit_rounded,
                      color: AppColors.primary,
                      size: 20,
                    ),
                  ),
                  title: const Text(
                    'Edit Card',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.onSurface,
                    ),
                  ),
                  subtitle: const Text(
                    'Modify question or answer',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.neutralLight,
                  ),
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => BlocProvider.value(
                          value: cubit,
                          child: CreateNewCardScreen(
                            quiz: quiz,
                            index: index,
                          ),
                        ),
                      ),
                    );
                  },
                ),

                const Divider(
                  height: 1,
                  indent: 70,
                  color: AppColors.surface,
                ),

                // ── Delete option ──
                ListTile(
                  leading: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.delete_rounded,
                      color: AppColors.error,
                      size: 20,
                    ),
                  ),
                  title: const Text(
                    'Delete Card',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.error,
                    ),
                  ),
                  subtitle: const Text(
                    'Remove this card permanently',
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.onSurfaceVariant,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(bottomSheetContext);
                    _showDeleteConfirmation(context, cubit, index);
                  },
                ),

                const SizedBox(height: 8),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void _showDeleteConfirmation(
  BuildContext context,
  NewCardCubit cubit,
  int index,
) {
  showDialog(
    context: context,
    builder: (dialogContext) {
      return AlertDialog(
        backgroundColor: AppColors.surfaceWhite,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Delete Card?',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: AppColors.onSurface,
          ),
        ),
        content: const Text(
          'This action cannot be undone. Are you sure you want to delete this card?',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.onSurfaceVariant,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: const Text(
              'Cancel',
              style: TextStyle(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              cubit.deleteCard(index);
            },
            child: const Text(
              'Delete',
              style: TextStyle(
                color: AppColors.error,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
}
