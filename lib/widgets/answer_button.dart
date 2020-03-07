import 'package:flutter/material.dart';

import '../screens/next_question_test_screen.dart';
import '../screens/game_screen.dart';

import 'package:provider/provider.dart';

import 'package:trivia_app/providers/question_provider.dart';

class AnswerButton extends StatefulWidget {
  final bool correct;
  final String answerText;
  final Color color;

  AnswerButton({this.color, this.correct, this.answerText});

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.color,
      child: Container(
        width: 195,
        height: 120,
        child: Center(
          child: Text(
            widget.answerText,
            style: TextStyle(fontSize: 15, color: Colors.black26),
          ),
        ),
      ),
    );
  }
}
