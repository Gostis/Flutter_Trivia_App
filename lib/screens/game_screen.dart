import 'package:flutter/material.dart';
import 'package:trivia_app/widgets/game_answers.dart';
import 'package:trivia_app/widgets/question_text.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Center(
            child: Text(
              'Hello',
              style: TextStyle(color: Colors.amber[900], fontSize: 40),
            ),
          ),
          QuestionText("Triva question placeholder"),
          GameAnswers(),
        ],
      ),
    ));
  }
}
