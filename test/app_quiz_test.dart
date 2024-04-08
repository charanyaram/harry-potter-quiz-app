// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app_quiz.dart';
import 'package:quiz_app/models/state.dart';

void main() {
  testWidgets('Main App interaction', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    
    await tester.pumpWidget(ChangeNotifierProvider(
         create: (context) => StateModel(),
         child: const Quiz(),
    ));

    // should start showing the home screen
    final titleFinder = find.text("Harry Potter Quiz App");
    final startFinder = find.text("Start the Quiz");

    expect(titleFinder, findsOneWidget);
    expect(startFinder, findsOneWidget);

    // tap the start button and we should move to the quiz
    await tester.tap(startFinder);

    await tester.pump();

    // verify we're on the question screen by text
    final questionFinder = find.text("Question 1");
    expect(questionFinder, findsOneWidget);

    // or by looking for a widget key
    final questionTextFinder = find.byKey(const Key('question-text'));
    expect(questionTextFinder, findsOneWidget);

  });
}
