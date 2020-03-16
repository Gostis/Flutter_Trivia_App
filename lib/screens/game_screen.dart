import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/providers/game_settings.dart';
import 'package:trivia_app/providers/question_provider.dart';
import 'package:trivia_app/widgets/game_answers.dart';
import 'package:trivia_app/widgets/question_text.dart';
import 'dart:async';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'next_question_test_screen.dart';

class Game extends StatefulWidget {
  final int numberOfQuestions;
  final int questionCounter;

  Game({this.numberOfQuestions, this.questionCounter});

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  void initState() {
    super.initState();

    new Future.delayed(
        const Duration(seconds: 4),
        () => nextScreen(
            context, widget.numberOfQuestions, widget.questionCounter));
  }

  @override
  Widget build(BuildContext context) {
    final questionStore = Provider.of<QuestionProvider>(context, listen: true);

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          getPercentageIndicator(context, 1.0),
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

getPercentageIndicator(BuildContext context, var1) {
  return new LinearPercentIndicator(
    width: 400.0,
    lineHeight: 8.0,
    percent: var1,
    animation: true,
    animationDuration: 4000,
    progressColor: Colors.blue,
  );
}

void nextScreen(BuildContext context, numberOfQuestions, questionCounter) {
  if (numberOfQuestions > questionCounter) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new Game(
                numberOfQuestions: numberOfQuestions,
                questionCounter: questionCounter + 1)));
  } else {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => NextQuestionScreen()));
  }
}
