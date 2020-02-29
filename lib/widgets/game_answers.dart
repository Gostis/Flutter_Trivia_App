import 'package:flutter/material.dart';

import 'package:trivia_app/widgets/answer_button.dart';

import 'package:provider/provider.dart';
import '../providers/question_provider.dart';

class GameAnswers extends StatefulWidget {
  @override
  _GameAnswersState createState() => _GameAnswersState();
}

class _GameAnswersState extends State<GameAnswers> {
  @override
  Widget build(BuildContext context) {
    final questionStore = Provider.of<QuestionProvider>(context, listen: true);
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            new AnswerButton(
                correct: questionStore.questions[questionStore.questionCounter]
                    .allAnswers[0].isCorrect,
                answerText: questionStore
                    .questions[questionStore.questionCounter]
                    .allAnswers[0]
                    .question),
            Expanded(
                child: new AnswerButton(
                    correct: questionStore
                        .questions[questionStore.questionCounter]
                        .allAnswers[1]
                        .isCorrect,
                    answerText: questionStore
                        .questions[questionStore.questionCounter]
                        .allAnswers[1]
                        .question)),
          ],
        ),
        Row(
          children: <Widget>[
            new AnswerButton(
                correct: questionStore.questions[questionStore.questionCounter]
                    .allAnswers[2].isCorrect,
                answerText: questionStore
                    .questions[questionStore.questionCounter]
                    .allAnswers[2]
                    .question),
            Expanded(
                child: new AnswerButton(
                    correct: questionStore
                        .questions[questionStore.questionCounter]
                        .allAnswers[3]
                        .isCorrect,
                    answerText: questionStore
                        .questions[questionStore.questionCounter]
                        .allAnswers[3]
                        .question))
          ],
        )
      ],
    );
  }
}
