class Question {
  String category;
  String question;
  String difficulty;
  String corrctAnswer;
  List<String> incorrectAnswers;

  Question(
      {this.category,
      this.question,
      this.difficulty,
      this.corrctAnswer,
      this.incorrectAnswers});

  factory Question.fromJson(Map<String, dynamic> parsedJson) {
    var incorrectAnswers = parsedJson['incorrect_answers'];

    List<String> incorrectAnswersList = new List<String>.from(incorrectAnswers);

    return new Question(
        category: parsedJson['category'],
        question: parsedJson['question'],
        difficulty: parsedJson['difficulty'],
        corrctAnswer: parsedJson['corect_answer'],
        incorrectAnswers: incorrectAnswersList);
  }
}
