class QuizQuestion {
  const QuizQuestion (this.questionText, this.answersList);

  final String questionText;
  final List<String> answersList;

  List<String> getShuffledAnswerList(){
    final shuffledAnswersList = List.of(answersList);
    shuffledAnswersList.shuffle();
    return shuffledAnswersList;
  }

  // create a quiz question from parsed JSON data
  factory QuizQuestion.fromJson(Map<String, dynamic> json) {

    return switch(json) {
      {
        'question': String question,
        'answers': List<dynamic> answers,
      } => 
        QuizQuestion(question, [for (var answer in answers) answer as String]),
    _ => throw const FormatException('Failed to parse QuizQuestion'),
    };
  }
}
