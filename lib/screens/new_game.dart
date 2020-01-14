import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewGame extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewGameMenu();
}

class Genre {
  final String genre, id;
  Genre({
    this.genre,
    this.id,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return new Genre(
      genre: json['name'].toString(),
      id: json['id'].toString(),
    );
  }
}

class _NewGameMenu extends State<NewGame> {
  List _locations;
  List difficulty = ["Easy", "Intermediate", "Difficult"];
  double lives = 3.0;

  String _selectedLocation; // Option 2
  String _selectedDifficulty;

  Future<List<String>> _parseCategories() async {
    http.Response response =
        await http.get('https://opentdb.com/api_category.php');

    setState(() {
      var responseJson = json.decode(response.body);
      _locations = responseJson['trivia_categories']
          .map((genre) => genre['name'].toString())
          .toList();
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "New Game",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 50,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Card(
                child: Container(
                  padding: EdgeInsets.all(8.0),
                  width: 300,
                  height: 320,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Category",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w600)),
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
                        items: _locations != null
                            ? _locations.map((location) {
                                return DropdownMenuItem(
                                  child: new Text(location),
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
                              fontSize: 20, fontWeight: FontWeight.w600)),
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
                              fontSize: 20, fontWeight: FontWeight.w600)),
                      Slider(
                        value: lives,
                        onChanged: (newLives) {
                          setState(() => lives = newLives);
                        },
                        min: 1,
                        max: 5,
                        divisions: 5,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
