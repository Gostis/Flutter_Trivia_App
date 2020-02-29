import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:trivia_app/providers/question_provider.dart';

class NextQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final questionStore = Provider.of<QuestionProvider>(context, listen: true);
    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Center(
              child: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: questionStore.correctAnswers.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Column(
                    children: <Widget>[
                      new Text(
                        "Question: ${questionStore.questions[index].question}",
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          new Text(
                            "Answer: ${questionStore.correctAnswers[index].question}",
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                          new Text(
                            "Correct answer: ${questionStore.questions[index].corrctAnswer}",
                            style: TextStyle(color: Colors.deepOrange),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                }),
          ),
          Text(
            "Number of correct Answers: ${questionStore.correctAnswerCounter}",
            style: TextStyle(color: Colors.blue, fontSize: 30),
          ),
          RaisedButton(
              onPressed: () => {
                    Provider.of<QuestionProvider>(context, listen: false)
                        .pushAnswer(true, "Hej test")
                  },
              child: Text("Add add", style: TextStyle(color: Colors.teal)))
        ],
      ))),
    ));
  }
}
