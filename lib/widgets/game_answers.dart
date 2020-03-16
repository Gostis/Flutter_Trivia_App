import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:trivia_app/models/question_model.dart';
import 'package:trivia_app/screens/game_screen.dart';
import 'package:trivia_app/screens/next_question_test_screen.dart';

import 'package:trivia_app/widgets/answer_button.dart';

import 'package:provider/provider.dart';
import '../providers/question_provider.dart';

class GameAnswers extends StatefulWidget {
  @override
  _GameAnswersState createState() => _GameAnswersState();
}

class _GameAnswersState extends State<GameAnswers> {
  List<Color> _answerColors = new List<Color>.filled(4, Colors.white);
  int _questionCounter;
  List<Answer> _answers;
  int _numberOfQuestions;

  @override
  Widget build(BuildContext context) {
    final questionStore = Provider.of<QuestionProvider>(context, listen: true);
    setState(() {
      _questionCounter = questionStore.questionCounter;
      _answers =
          questionStore.questions[questionStore.questionCounter].allAnswers;
      _numberOfQuestions = questionStore.questions.length;
    });
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                answerPressed(context, 0, _numberOfQuestions);
              },
              child: new AnswerButton(
                  correct: questionStore
                      .questions[questionStore.questionCounter]
                      .allAnswers[0]
                      .isCorrect,
                  answerText: questionStore
                      .questions[questionStore.questionCounter]
                      .allAnswers[0]
                      .question,
                  color: _answerColors[0]),
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                answerPressed(context, 1, _numberOfQuestions);
              },
              child: new AnswerButton(
                  correct: questionStore
                      .questions[questionStore.questionCounter]
                      .allAnswers[1]
                      .isCorrect,
                  answerText: questionStore
                      .questions[questionStore.questionCounter]
                      .allAnswers[1]
                      .question,
                  color: _answerColors[1]),
            )),
          ],
        ),
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                answerPressed(context, 2, _numberOfQuestions);
              },
              child: new AnswerButton(
                  correct: questionStore
                      .questions[questionStore.questionCounter]
                      .allAnswers[2]
                      .isCorrect,
                  answerText: questionStore
                      .questions[questionStore.questionCounter]
                      .allAnswers[2]
                      .question,
                  color: _answerColors[2]),
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {
                answerPressed(context, 3, _numberOfQuestions);
              },
              child: new AnswerButton(
                  correct: questionStore
                      .questions[questionStore.questionCounter]
                      .allAnswers[3]
                      .isCorrect,
                  answerText: questionStore
                      .questions[questionStore.questionCounter]
                      .allAnswers[3]
                      .question,
                  color: _answerColors[3]),
            ))
          ],
        )
      ],
    );
  }

  void answerPressed(
      BuildContext context, int answerIndex, int numberOfQuestions) {
    if (_answers[answerIndex].isCorrect) {
      _answerColors[answerIndex] = Colors.green;
      Provider.of<QuestionProvider>(context, listen: false)
          .incrementCorrectAnswers();
    } else {
      _answerColors[answerIndex] = Colors.red;
      int correctAnswer;

      for (var i = 0; i < _answers.length; i++) {
        if (_answers[i].isCorrect) {
          correctAnswer = i;
          break;
        }
      }
      _answerColors[correctAnswer] = Colors.green;
    }

    if (_questionCounter < 5) {
      Provider.of<QuestionProvider>(context, listen: false).pushAnswer(
          _answers[answerIndex].isCorrect, _answers[answerIndex].question);
      Provider.of<QuestionProvider>(context, listen: false).incrementQuestion();
      Timer(Duration(seconds: 3), () {
        nextQuestion(context, _questionCounter, numberOfQuestions);
      });
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => NextQuestionScreen()));
    }
  }

  void nextQuestion(
      BuildContext context, int questionCounter, int numberOfQuestions) {
    print("Question counter:  $questionCounter");
    print("numberOfQuestions:  $numberOfQuestions");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => new Game(
                numberOfQuestions: numberOfQuestions,
                questionCounter: questionCounter)));
  }
}
