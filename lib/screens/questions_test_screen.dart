import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/question_model.dart';
import 'package:trivia_app/utils/question_api.dart';

import 'package:provider/provider.dart';
import 'package:trivia_app/providers/game_settings.dart';
import 'package:trivia_app/providers/question_provider.dart';
import 'game_screen.dart';

// Other approach
// import 'package:trivia_app/utils/question_services.dart';

// class QuestionScreenTest extends StatefulWidget {
//   @override
//   _QuestionScreenTestState createState() => _QuestionScreenTestState();
// }

// class _QuestionScreenTestState extends State<QuestionScreenTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Question json parse")),
//       body: Center(
//           child: FutureBuilder<List<Question>>(
//         future: getQuestions(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             List<Question> questions = snapshot.data;
//             return new ListView(
//               children: questions
//                   .map((question) => Text('Question: ' + question.question))
//                   .toList(),
//             );
//           } else if (snapshot.hasError) {
//             return Text('${snapshot.error}');
//           }
//         },
//       )),
//     );
//   }
// }

class MyListScreen extends StatefulWidget {
  @override
  createState() => _MyListScreenState();
}

class _MyListScreenState extends State {
  var questions = new List<Question>();

  _getQuestions() {
    getQuestions().then((response) {
      setState(() {
        var list = json.decode(response.body);
        questions = List<Question>.from(
            list['results'].map((model) => Question.fromJson(model)));
      });
      print("All answersList: ");
      for (var i = 0; i < questions[0].allAnswers.length; i++) {
        print(
            "${questions[0].allAnswers[i].isCorrect}, ${questions[0].allAnswers[i].question}");
      }
    });
  }

  initState() {
    super.initState();
    _getQuestions();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Question List"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return ListTile(title: Text(questions[index].question));
              },
            ),
          ),
          RaisedButton(
              onPressed: () => startGame(),
              child: Text("Go to game", style: TextStyle(color: Colors.teal)))
        ],
      ),
    );
  }

  void startGame() {
    Provider.of<QuestionProvider>(context, listen: false)
        .importQuestions(questions);

    Navigator.push(
        context, MaterialPageRoute(builder: (context) => new Game()));
  }
}
