import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:quiz_app/models/question_model.dart';

class StateModel extends ChangeNotifier {
  
  final List<QuizQuestion> _questions = [
  const QuizQuestion("What is the name of Harry Potter's Owl?", 
  [
    'Hedwig',
    'Crookshanks',
    'Fang',
    'Scabbers',
  ]),
  const QuizQuestion('What is the name of the train that takes students to Hogwarts?', 
  [
    'Hogwarts Express',
    'Knight Bus',
    'Thestral Carriage',
    'Nimbus 2000',
  ]),
  const QuizQuestion(
    'Which magical device allows Harry Potter to view memories?',
    [
      'Pensieve',
      'Time-Turner',
      'Marauder''s Map',
      'Invisibility Cloak',
    ],
  ),
  const QuizQuestion(
    'What is the name of the magical sport played on flying broomsticks?',
    [
      'Quidditch',
      'Wizard Chess',
      'Gobstones',
      'Wizard Dueling',
    ],
  ),
  const QuizQuestion(
    'What is the name of the wizarding prison guarded by Dementors?',
    [
      'Azkaban',
      'Nurmengard',
      'Gringotts',
      'Diagon Alley',
    ],
  ),
  const QuizQuestion(
    'What is the name of the train platform where Hogwarts students catch the Hogwarts Express?',
    [
      'Platform 9¾',
      'Platform 10',
      'Platform 7½',
      'Platform 8',
       ]
    ),
];
  List<String> _answers = [];
  int currentQuestion = 0;
  String _status = "start";   // quiz status flag

  // initialise the quiz in the constructor
  StateModel() {
    resetQuiz();
  }

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<QuizQuestion> get questions => UnmodifiableListView(_questions);
  UnmodifiableListView<String> get answers => UnmodifiableListView(_answers);
  // this is for display of the current question number which should be 1 index
  int get currentQuestionNumber => currentQuestion + 1;

  String get quizStatus => _status;

  void startQuiz() {
    _status = "in-progress";
    notifyListeners();
  }

  void resetQuiz() {
    currentQuestion = 0;
    _status = "start";
    resetAnswers();
    notifyListeners();
  }

  QuizQuestion getCurrentQuestion() => _questions[currentQuestion];

  void advanceQuestion() {
    if (++currentQuestion >= _questions.length) {
      _status = "complete";
      currentQuestion--;  // just return the last question again
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