import 'package:flutter/material.dart';

import '../screens/next_question_test_screen.dart';
import '../screens/game_screen.dart';

import 'package:provider/provider.dart';

import 'package:trivia_app/providers/question_provider.dart';

class AnswerButton extends StatefulWidget {
  final bool correct;
  final String answerText;

  AnswerButton({this.correct, this.answerText});

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    final questionStore = Provider.of<QuestionProvider>(context, listen: true);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.correct) {
            _color = Colors.green;
            Provider.of<QuestionProvider>(context, listen: false)
                .incrementCorrectAnswers();
          } else {
            _color = Colors.red;
          }

          if (questionStore.correctAnswers.length < 5) {
            Provider.of<QuestionProvider>(context, listen: false)
                .pushAnswer(widget.correct, widget.answerText);
            Provider.of<QuestionProvider>(context, listen: false)
                .incrementQuestion();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => new Game()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NextQuestionScreen()));
          }
        });
      },
      child: Card(
        color: _color,
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
      ),
    );
  }
}
