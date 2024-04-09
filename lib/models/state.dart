import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:quiz_app/models/question_model.dart';
import 'package:quiz_app/services/api_service.dart';

class StateModel extends ChangeNotifier {
  
  final http.Client client;

  List<QuizQuestion> _questions = [];
  List<String> _answers = [];
  int currentQuestion = 0;
  String _status = "start";   // quiz status flag

  // initialise the quiz in the constructor
  StateModel(this.client) {
    // get the questions from the server
    Future<List<QuizQuestion>> futureQuestions = QuestionAPIService(client).getQuestions();
    
    futureQuestions.then((questionList) {
      _questions = questionList;
      resetQuiz();
    });
  }

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<QuizQuestion> get questions => UnmodifiableListView(_questions);
  UnmodifiableListView<String> get answers => UnmodifiableListView(_answers);
  // this is for display of the current question number which should be 1 index
  int get currentQuestionNumber => currentQuestion + 1;

  String get quizStatus => _status;

  void resetQuiz() {
    currentQuestion = 0;
    _status = "start";
    resetAnswers();
    notifyListeners();
  }

  void startQuiz() {
    _status = "in-progress";
    notifyListeners();
  }

  QuizQuestion getCurrentQuestion() {
    if (currentQuestion < _questions.length) {
      return _questions[currentQuestion];
    } else {
      // return a null question since we don't have any
      return const QuizQuestion('', []);
    }
  }

  void advanceQuestion() {
    if (++currentQuestion >= _questions.length) {
      _status = "complete";
      notifyListeners();
    }
  }

  void add(QuizQuestion q) {
    _questions.add(q);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }

  void addAnswer(String answer) {
    _answers[currentQuestion] = answer;
    notifyListeners();
  }

  void resetAnswers() {
    _answers = List<String>.filled(_questions.length, "");
  }

  List<Map<String,Object>> getSummaryData(){
    List<Map<String,Object>> summaryData = [];

    for(var i=0; i < _answers.length; i++){
      summaryData.add({
        'questionIndex': i,
        'question': _questions[i].questionText,
        'correctAnswer': _questions[i].answersList[0],
        'chosenAnswer':_answers[i],
      });
    }
    return summaryData;
  }
}