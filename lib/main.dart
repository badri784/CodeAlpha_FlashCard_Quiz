import 'package:flash_card_quiz/core/model/model.dart';
import 'package:flash_card_quiz/flash_card.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(QuizModelAdapter());
  await Hive.openBox<QuizModel>('quizBox');
  runApp(const MyApp());
}

