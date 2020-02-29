import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:trivia_app/providers/game_settings.dart';
import 'package:trivia_app/providers/question_provider.dart';

class NextQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<QuestionProvider>(context, listen: true);
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Center(
              child: Column(
        children: <Widget>[
          Text(
            'Your answer was ${settings.correctAnswers.length}',
            style: TextStyle(fontSize: 30, color: Colors.red),
          ),
          RaisedButton(
              onPressed: () => {
                    Provider.of<QuestionProvider>(context, listen: false)
                        .pushAnswer(true)
                  },
              child: Text("Add add", style: TextStyle(color: Colors.teal)))
        ],
      ))),
    ));
  }
}
