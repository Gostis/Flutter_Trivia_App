import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../models/question_model.dart';

class QuestionProvider with ChangeNotifier {
  List<Answer> _correctAnswers = [];
  List<Question> _questions;
  int _questionCounter = 0;
  int _correctAnswerCounter = 0;

  //Getters
  List<Answer> get correctAnswers => _correctAnswers;
  List<Question> get questions => _questions;
  int get questionCounter => _questionCounter;
  int get correctAnswerCounter => _correctAnswerCounter;

  void importQuestions(List<Question> questions) {
    _questions = questions;

    notifyListeners();
  }

  void pushAnswer(bool answer, String question) {
    _correctAnswers.add(new Answer(isCorrect: answer, question: question));
    notifyListeners();
  }

  void incrementQuestion() {
    _questionCounter++;

    notifyListeners();
  }

  void incrementCorrectAnswers() {
    _correctAnswerCounter++;

    notifyListeners();
  }
}
