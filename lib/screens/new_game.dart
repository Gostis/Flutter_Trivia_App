import 'dart:convert';
import 'dart:developer';

import 'package:provider/provider.dart';
import 'package:trivia_app/providers/game_settings.dart';
import 'package:trivia_app/screens/test_screen.dart';

import 'game_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:trivia_app/models/genre_model.dart';

import '../utils/question_api.dart';

class NewGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewGameMenu();
}

class _NewGameMenu extends State<NewGame> {
  List<Genre> categories;
  bool pressed = true;
  List difficulty = ["Easy", "Intermediate", "Difficult"];
  double lives = 3.0;
  double timePerQuestion = 10;

  Genre _selectedLocation; // Option 2
  String _selectedDifficulty;

  Future<List<String>> _parseCategories() async {
    http.Response response =
        await http.get('https://opentdb.com/api_category.php');

    setState(() {
      var responseJson = json.decode(response.body);
      categories = List<Genre>.from(responseJson['trivia_categories']
          .map((genre) => Genre.fromJson(genre)));
    });
  }

  @override
  void initState() {
    this._parseCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 40),
          Text(
            "New Game",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 35,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(height: (MediaQuery.of(context).size.width / 4) - 55),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(children: <Widget>[
                Center(
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      width: 300,
                      height: 350,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Category",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          DropdownButton(
                            isExpanded: true,
                            hint: Center(
                              child: Text('Please choose a category'),
                            ), // Not necessary for Option 1
                            value: _selectedLocation,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedLocation = newValue;
                              });
                            },
                            items: categories != null
                                ? categories.map((location) {
                                    return DropdownMenuItem(
                                      child: new Text(location.genre),
                                      value: location,
                                    );
                                  }).toList()
                                : null,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Difficulty",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          DropdownButton(
                            isExpanded: true,
                            hint: Center(
                              child: Text('Please choose a difficulty'),
                            ), // Not necessary for Option 1
                            value: _selectedDifficulty,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedDifficulty = newValue;
                              });
                            },
                            items: <String>['Easy', 'Intermediate', 'Hard']
                                .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                            }).toList(),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text("Lives",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          Slider(
                            activeColor: Theme.of(context).primaryColor,
                            label: lives > 1
                                ? lives.toInt().toString() + " lives"
                                : lives.toInt().toString() +
                                    " life", //Remove decimal
                            value: lives,
                            onChanged: (newLives) {
                              setState(() => lives = newLives);
                            },
                            min: 1,
                            max: 5,
                            divisions: 4,
                          ),
                          SizedBox(
                            height: 0,
                          ),
                          Text("Time Per Question",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w600)),
                          Slider(
                            activeColor: Theme.of(context).primaryColor,

                            label: timePerQuestion.toInt().toString() +
                                " sec", //Remove decimal
                            value: timePerQuestion,
                            onChanged: (newLives) {
                              setState(() => timePerQuestion = newLives);
                            },
                            min: 5,
                            max: 20,
                            divisions: 15,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                OutlineButton(
                  textColor: Color(0xffeb606a),
                  onPressed: () {
                    confirmSettings(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TestScreen()));
                  },
                  highlightedBorderColor: Color(0xffeb606a),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                  child: Text('Start Game',
                      style: TextStyle(
                          fontSize: 20, color: Theme.of(context).primaryColor)),
                ),
              ]),
            ],
          ),
        ],
      ),
    )));
  }

  void confirmSettings(BuildContext context) {
    Provider.of<GameSettings>(context, listen: false).changeSettings(
        _selectedDifficulty.toString(),
        _selectedLocation,
        lives.toInt(),
        timePerQuestion.toInt());
  }
}
