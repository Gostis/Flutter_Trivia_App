import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:trivia_app/models/genre_model.dart';

Future getQuestions({String category = "", String difficulty = ""}) {
  category = category != "" ? "&category=" + category : "";
  difficulty = difficulty != "" ? "&difficulty=" + difficulty : "";

  String url = "https://opentdb.com/api.php?amount=10" +
      category +
      difficulty +
      "&type=multiple";
  print(url);
  return http.get(url);
}
