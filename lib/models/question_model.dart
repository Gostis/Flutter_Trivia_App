import '../utils/util_functions.dart';

class Question {
  String category;
  String question;
  String difficulty;
  String corrctAnswer;
  List<String> incorrectAnswers;
  List<Answer> allAnswers;

  Question(
      {this.category,
      this.question,
      this.difficulty,
      this.corrctAnswer,
      this.incorrectAnswers,
      this.allAnswers});

  factory Question.fromJson(Map<String, dynamic> parsedJson) {
    var incorrectAnswers = parsedJson['incorrect_answers'];

    List<String> incorrectAnswersList = new List<String>.from(incorrectAnswers);

    List<Answer> allAnswersList = new List<Answer>();

    for (var item in incorrectAnswersList) {
      allAnswersList.add(new Answer(isCorrect: false, question: item));
    }
    allAnswersList.add(
        new Answer(isCorrect: true, question: parsedJson['correct_answer']));

    List<Answer> allAnswersListShuffled = shuffle(allAnswersList);

    return new Question(
        category: parsedJson['category'],
        question: parsedJson['question'],
        difficulty: parsedJson['difficulty'],
        corrctAnswer: parsedJson['correct_answer'],
        incorrectAnswers: incorrectAnswersList,
        allAnswers: allAnswersListShuffled);
  }
}

class Answer {
  String question;
  bool isCorrect;

  Answer({this.question, this.isCorrect});
}
