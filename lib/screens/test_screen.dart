import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trivia_app/providers/game_settings.dart';

class TestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<GameSettings>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: Container(
            child: Column(children: <Widget>[
          Text(
            'Your difficulty ${settings.difficulty}',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Your category ${settings.category.genre}',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          Text(
            'Your category ${settings.lives}',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          OutlineButton(
              child: Text('Decrement',
                  style: TextStyle(
                      fontSize: 20, color: Theme.of(context).primaryColor)),
              textColor: Color(0xffeb606a),
              onPressed: () => updateValues(context))
        ])),
      ),
    );
  }

  updateValues(BuildContext context) {
    print("called");

    Provider.of<GameSettings>(context, listen: false).decrementLives();
    print(Provider.of<GameSettings>(context, listen: false).lives.toString());
  }
}
