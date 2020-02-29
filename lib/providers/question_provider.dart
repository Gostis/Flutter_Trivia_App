import 'package:flutter/foundation.dart';
import '../models/question_model.dart';

class QuestionProvider with ChangeNotifier {
  List<bool> _correctAnswers = [];
  List<Question> _questions;

  //Getters
  List<bool> get correctAnswers => _correctAnswers;
  List<Question> get questions => _questions;

  void importQuestions(List<Question> questions) {
    _questions = questions;

    notifyListeners();
  }

  void pushAnswer(bool answer) {
    print("push answer");
    _correctAnswers.add(answer);
    notifyListeners();
  }
}
