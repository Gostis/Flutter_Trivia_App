import 'package:flutter/foundation.dart';
import '../models/question_model.dart';

class GameSettings with ChangeNotifier {
  //Initial state
  String _category;
  String _difficulty;
  int _time;
  int _lives;
  List<bool> _correctAnswers = [];
  List<Question> _questions;
  //updating over time
  int _score;
  int _remaningLives;

  //GameSettings();

  //Getters
  String get category => _category;
  String get difficulty => _difficulty;
  int get time => _time;
  int get lives => _lives;
  int get score => _score;
  int get remainingLives => _remaningLives;
  List<bool> get correctAnswers => _correctAnswers;
  List<Question> get questions => _questions;

  void changeSettings(String category, String difficulty, int time, int lives) {
    _category = category;
    _difficulty = difficulty;
    _time = time;
    _lives = lives;
    notifyListeners();
  }

  void importQuestions(List<Question> questions) {
    _questions = questions;

    notifyListeners();
  }

  void pushAnswer(bool answer) {
    print("push answer");
    _correctAnswers.add(answer);
    notifyListeners();
  }

  void decrementLives() {
    _lives--;
    notifyListeners();
  }
}
