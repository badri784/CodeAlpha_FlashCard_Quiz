import 'dart:developer';

import 'package:flash_card_quiz/core/model/model.dart';
import 'package:flash_card_quiz/core/state_mangment/cubit/new_card_cubit.dart';
import 'package:flash_card_quiz/core/themeing/theme.dart';
import 'package:flash_card_quiz/feature/ui/add_screen/widget/card_text_field.dart';
import 'package:flash_card_quiz/feature/ui/add_screen/widget/save_flashcard_button.dart';
import 'package:flash_card_quiz/feature/ui/add_screen/widget/section_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateNewCardScreen extends StatefulWidget {
  const CreateNewCardScreen({super.key, this.quiz, this.index});

  /// If provided, the screen will be in edit mode
  final QuizModel? quiz;
  final int? index;

  @override
  State<CreateNewCardScreen> createState() => _CreateNewCardScreenState();
}

class _CreateNewCardScreenState extends State<CreateNewCardScreen> {
  final TextEditingController questionController = TextEditingController();
  final TextEditingController answerController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get isEditMode => widget.quiz != null && widget.index != null;

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      questionController.text = widget.quiz!.question;
      answerController.text = widget.quiz!.answer;
    }
  }

  @override
  void dispose() {
    questionController.dispose();
    answerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceWhite,
      appBar: AppBar(
        backgroundColor: AppColors.surfaceWhite,
        centerTitle: true,
        title: Text(
          isEditMode ? 'Edit Flashcard' : 'Add Flashcard',
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.onSurface,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              // ── Scrollable content ──
              Expanded(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ── Question field ──
                      const SectionLabel(text: 'Question (Front)'),
                      const SizedBox(height: 8),
                      CardTextField(
                        validator: (textValue) {
                          if (textValue == null || textValue.trim().isEmpty) {
                            return 'Please enter a question';
                          }
                          return null;
                        },
                        controller: questionController,
                        hintText: 'Type the concept or question here...',
                        maxLines: 4,
                      ),
                      const SizedBox(height: 24),

                      // ── Answer field ──
                      const SectionLabel(text: 'Answer (Back)'),
                      const SizedBox(height: 8),
                      CardTextField(
                        validator: (textValue) {
                          if (textValue == null || textValue.trim().isEmpty) {
                            return 'Please enter an answer';
                          }
                          return null;
                        },
                        controller: answerController,
                        hintText:
                            'Type the detailed answer, definition, or\ntranslation...',
                        maxLines: 6,
                      ),
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),

              SaveFlashcardButton(
                buttonText:
                    isEditMode ? 'Update Flashcard' : 'Save Flashcard',
                onPressed: () {
                  if (!formKey.currentState!.validate()) return;
                  log(questionController.text);

                  if (isEditMode) {
                    context.read<NewCardCubit>().editCard(
                          widget.index!,
                          questionController.text,
                          answerController.text,
                        );
                  } else {
                    context.read<NewCardCubit>().addCard(
                          questionController.text,
                          answerController.text,
                        );
                  }
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
