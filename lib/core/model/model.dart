import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 0)
class QuizModel extends HiveObject {
  @HiveField(0)
  final String question;

  @HiveField(1)
  final String answer;

  QuizModel({required this.question, required this.answer});

  QuizModel copyWith({String? question, String? answer}) {
    return QuizModel(
      question: question ?? this.question,
      answer: answer ?? this.answer,
    );
  }
}
