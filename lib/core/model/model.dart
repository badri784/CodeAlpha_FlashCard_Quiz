import 'package:equatable/equatable.dart';

class QuizModel extends Equatable {
  final String question;
  final String answer;

  const QuizModel({required this.question, required this.answer});

  @override
  List<Object?> get props => [question, answer];
}
