

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
  QuizQuestion('What is the name of the train that takes students to Hogwarts?', 
  [
    'Hogwarts Express',
    'Knight Bus',
    'Thestral Carriage',
    'Nimbus 2000',
  ]),
  QuizQuestion(
    'Which magical device allows Harry Potter to view memories?',
    [
      'Pensieve',
      'Time-Turner',
      'Marauder''s Map',
      'Invisibility Cloak',
    ],
  ),
  QuizQuestion(
    'What is the name of the magical sport played on flying broomsticks?',
    [
      'Quidditch',
      'Wizard Chess',
      'Gobstones',
      'Wizard Dueling',
    ],
  ),
  QuizQuestion(
    'What is the name of the wizarding prison guarded by Dementors?',
    [
      'Azkaban',
      'Nurmengard',
      'Gringotts',
      'Diagon Alley',
    ],
  ),
  QuizQuestion(
    'What is the name of the train platform where Hogwarts students catch the Hogwarts Express?',
    [
      'Platform 9¾',
      'Platform 10',
      'Platform 7½',
      'Platform 8',
       ]
    ),
];

  /// An unmodifiable view of the items in the cart.
  UnmodifiableListView<QuizQuestion> get questions => UnmodifiableListView(_questions);

  QuizQuestion getQuestion(int index) {
    return _questions[index];
  }

  void add(QuizQuestion q) {
    _questions.add(q);
    // This call tells the widgets that are listening to this model to rebuild.
    notifyListeners();
  }


}