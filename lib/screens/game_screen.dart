import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/providers/game_settings.dart';
import 'package:trivia_app/providers/question_provider.dart';
import 'package:trivia_app/widgets/game_answers.dart';
import 'package:trivia_app/widgets/question_text.dart';
import 'dart:async';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
    final questionStore = Provider.of<QuestionProvider>(context, listen: true);
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
          QuestionText(
              questionStore.questions[questionStore.questionCounter].question),
          GameAnswers(),
        ],
      ),
    ));
  }
}
