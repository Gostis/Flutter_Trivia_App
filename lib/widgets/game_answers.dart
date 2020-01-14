import 'package:flutter/material.dart';

import 'package:trivia_app/widgets/answer_button.dart';

class GameAnswers extends StatefulWidget {
  @override
  _GameAnswersState createState() => _GameAnswersState();
}

class _GameAnswersState extends State<GameAnswers> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            new AnswerButton(correct: true, answerText: "Answer 1"),
            Expanded(
                child: new AnswerButton(correct: false, answerText: "Answer 2"))
          ],
        ),
        Row(
          children: <Widget>[
            new AnswerButton(correct: false, answerText: "Answer 3"),
            Expanded(
                child: new AnswerButton(correct: true, answerText: "Answer 4"))
          ],
        )
      ],
    );
  }
}
