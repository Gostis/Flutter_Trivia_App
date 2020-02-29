import 'package:flutter/foundation.dart';
import '../models/question_model.dart';

class QuestionProvider with ChangeNotifier {
  List<bool> _correctAnswers = [];
  List<Question> _questions;
  int _questionCounter = 0;
  //Getters
  List<bool> get correctAnswers => _correctAnswers;
  List<Question> get questions => _questions;
  int get questionCounter => _questionCounter;

  void importQuestions(List<Question> questions) {
    _questions = questions;

    notifyListeners();
  }

  void pushAnswer(bool answer) {
    print("push answer");
    _correctAnswers.add(answer);
    notifyListeners();
  }

  void incrementQuestion() {
    _questionCounter++;
    print(_questionCounter);
    notifyListeners();
  }
}
