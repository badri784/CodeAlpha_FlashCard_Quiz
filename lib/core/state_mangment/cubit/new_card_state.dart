part of 'new_card_cubit.dart';

sealed class NewCardState {}

final class NewCardInitial extends NewCardState {}

final class NewCardLoading extends NewCardState {}

final class NewCardSuccess extends NewCardState {
  NewCardSuccess({required this.quizeList});
  final List<QuizModel> quizeList;
}

final class NewCardFailure extends NewCardState {
  NewCardFailure({required this.errorMessage});
  final String errorMessage;
}
