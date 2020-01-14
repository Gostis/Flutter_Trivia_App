import 'package:flutter/material.dart';
import 'package:trivia_app/widgets/game_answers.dart';

class Game extends StatefulWidget {
  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  @override
  Widget build(BuildContext context) {
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
          Card(
              child: Container(
            width: 400,
            height: 300,
            child: Center(
              child: Text('Trivia Question placeholder',
                  style: TextStyle(fontSize: 20)),
            ),
          )),
          GameAnswers(),
        ],
      ),
    ));
  }
}
