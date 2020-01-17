import 'dart:async' show Future;
import 'dart:convert';
import 'package:trivia_app/models/question_model.dart';
import 'package:http/http.dart' as http;

const APIurl = "https://opentdb.com/api.php?amount=10";

Future<List<Question>> getQuestions() async {
  final response = await http.get(APIurl);

  if (response.statusCode == 200) {
    final questions = json.decode(response.body);
    return List<Question>.from(questions['results']
        .map((question) => new Question.fromJson(question)));
  } else {
    throw Exception('Failed to load questions from API');
  }
}
