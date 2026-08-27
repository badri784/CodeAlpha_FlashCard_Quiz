import 'dart:developer';

import 'package:flash_card_quiz/core/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'new_card_state.dart';

class NewCardCubit extends Cubit<NewCardState> {
  NewCardCubit() : super(NewCardInitial());
  List<QuizModel> quizList = [];
  void addCard(String question, String answer) {
    emit(NewCardLoading());
    try {
      quizList.add(QuizModel(question: question, answer: answer));
      log(question.toString());
      emit(NewCardSuccess(quizeList: quizList));
    } catch (e) {
      emit(NewCardFailure(errorMessage: e.toString()));
    }
  }
}
