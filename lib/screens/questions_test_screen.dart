import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trivia_app/models/question_model.dart';
import 'package:trivia_app/utils/question_api.dart';

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
        body: ListView.builder(
          itemCount: questions.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(questions[index].question));
          },
        ));
  }
}
