class Question {
  String category;
  String question;
  String difficulty;
  String corrctAnswer;
  List<String> incorrectAnswers;
  List<String> allAnswers;

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
    List<String> allAnswersList = incorrectAnswersList;
    allAnswersList.add(parsedJson['correct_answer']);

    return new Question(
        category: parsedJson['category'],
        question: parsedJson['question'],
        difficulty: parsedJson['difficulty'],
        corrctAnswer: parsedJson['correct_answer'],
        incorrectAnswers: incorrectAnswersList,
        allAnswers: allAnswersList);
  }
}
