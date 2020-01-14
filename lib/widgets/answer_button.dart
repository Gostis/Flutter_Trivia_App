import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  AnswerButton({this.correct, this.answerText});
  final bool correct;
  final String answerText;

  @override
  _AnswerButtonState createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  Color _color = Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (widget.correct) {
            _color = Colors.green;
          } else {
            _color = Colors.red;
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
