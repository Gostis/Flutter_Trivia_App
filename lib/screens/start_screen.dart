import 'package:flutter/material.dart';
import 'package:trivia_app/screens/new_game.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Center(
              child: Text('JACSA',
                  style: TextStyle(color: Colors.amber, fontSize: 40)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Center(
              child: Text('Trivia',
                  style: TextStyle(color: Colors.amber, fontSize: 20)),
            ),
          ),
          Column(
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewGame()));
                },
                child: Text('Start Game',
                    style: TextStyle(fontSize: 20, color: Colors.black26)),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('High score',
                    style: TextStyle(fontSize: 20, color: Colors.black26)),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(horizontal: 38),
                child: Text('About',
                    style: TextStyle(fontSize: 20, color: Colors.black26)),
              ),
              SizedBox(
                height: 10,
              ),
              RaisedButton(
                onPressed: () {},
                padding: EdgeInsets.symmetric(horizontal: 48),
                child: Text('Exit',
                    style: TextStyle(fontSize: 20, color: Colors.black26)),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
