import 'package:flutter/foundation.dart';

class GameSettings with ChangeNotifier {
  //Initial state
  String _category;
  String _difficulty;
  int _time;
  int _lives;

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

  void changeSettings(String category, String difficulty, int time, int lives) {
    _category = category;
    _difficulty = difficulty;
    _time = time;
    _lives = lives;
    notifyListeners();
  }

  void decrementLives() {
    _lives--;
    notifyListeners();
  }
}
