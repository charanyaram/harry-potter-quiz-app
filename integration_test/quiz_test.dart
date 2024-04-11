import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http; 
import 'package:integration_test/integration_test.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app_quiz.dart';
import 'package:quiz_app/models/state.dart';


void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized(); // NEW

  testWidgets('test the quiz',
      (tester) async {

    await tester.pumpWidget(ChangeNotifierProvider(
         create: (context) => StateModel(http.Client()),
         child: const Quiz(),
    ));

    await tester.pump(const Duration(seconds: 3));

    // should start showing the home screen
    final titleFinder = find.text("Harry Potter Quiz App");
    final startFinder = find.text("Start the Quiz");

    expect(titleFinder, findsOneWidget);
    expect(startFinder, findsOneWidget);

    // tap the start button and we should move to the quiz
    await tester.tap(startFinder);

    await tester.pump(const Duration(seconds: 1));

    // verify we're on the question screen by text
    final questionHeaderFinder = find.text("Question 1");
    expect(questionHeaderFinder, findsOneWidget);

    final questionTextFinder = find.text("What is the name of Harry Potter's Owl?");
    expect(questionTextFinder, findsOneWidget);

    final answerButtonFinder = find.byKey(const Key('answer-button-0'));
    expect(answerButtonFinder, findsOneWidget);

    await tester.tap(answerButtonFinder);

    await tester.pump(const Duration(seconds: 1));

    final nextQuestionHeaderFinder = find.text("Question 2");
    expect(nextQuestionHeaderFinder, findsOneWidget);

  });
}