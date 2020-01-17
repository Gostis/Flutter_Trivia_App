import 'package:flutter/material.dart';

class QuestionText extends StatefulWidget {
  final String _questionText;

  QuestionText(this._questionText);

  @override
  _QuestionTextState createState() => _QuestionTextState();
}

class _QuestionTextState extends State<QuestionText> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Container(
      width: 400,
      height: 300,
      child: Center(
        child: Text(widget._questionText, style: TextStyle(fontSize: 20)),
      ),
    ));
  }
}
