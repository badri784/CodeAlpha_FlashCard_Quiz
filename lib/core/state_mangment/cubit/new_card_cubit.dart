import 'dart:developer';

import 'package:flash_card_quiz/core/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'new_card_state.dart';

class NewCardCubit extends Cubit<NewCardState> {
  NewCardCubit() : super(NewCardInitial());

  static const String _boxName = 'quizBox';
  List<QuizModel> quizList = [];

  /// Load all cards from Hive on startup
  Future<void> loadCards() async {
    emit(NewCardLoading());
    try {
      final box = Hive.box<QuizModel>(_boxName);
      quizList = box.values.toList();
      emit(NewCardSuccess(quizeList: quizList));
    } catch (e) {
      emit(NewCardFailure(errorMessage: e.toString()));
    }
  }

  /// Add a new card
  Future<void> addCard(String question, String answer) async {
    emit(NewCardLoading());
    try {
      final box = Hive.box<QuizModel>(_boxName);
      final newCard = QuizModel(question: question, answer: answer);
      await box.add(newCard);
      quizList = box.values.toList();
      log(question);
      emit(NewCardSuccess(quizeList: quizList));
    } catch (e) {
      emit(NewCardFailure(errorMessage: e.toString()));
    }
  }

  /// Edit an existing card by index
  Future<void> editCard(int index, String question, String answer) async {
    emit(NewCardLoading());
    try {
      final box = Hive.box<QuizModel>(_boxName);
      final updatedCard = QuizModel(question: question, answer: answer);
      await box.putAt(index, updatedCard);
      quizList = box.values.toList();
      emit(NewCardSuccess(quizeList: quizList));
    } catch (e) {
      emit(NewCardFailure(errorMessage: e.toString()));
    }
  }

  /// Delete a card by index
  Future<void> deleteCard(int index) async {
    emit(NewCardLoading());
    try {
      final box = Hive.box<QuizModel>(_boxName);
      await box.deleteAt(index);
      quizList = box.values.toList();
      emit(NewCardSuccess(quizeList: quizList));
    } catch (e) {
      emit(NewCardFailure(errorMessage: e.toString()));
    }
  }
}
