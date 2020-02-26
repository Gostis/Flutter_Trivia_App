import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:trivia_app/models/game_settings.dart';

class NextQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<GameSettings>(context, listen: true);
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
                    Provider.of<GameSettings>(context, listen: false)
                        .pushAnswer(true)
                  },
              child: Text("Add add", style: TextStyle(color: Colors.teal)))
        ],
      ))),
    ));
  }
}
