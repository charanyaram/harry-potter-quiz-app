

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/screens/home_screen/app_home_screen.dart';


class QuizUtil {
    void startQuiz() => {};
}

class MyMock extends Mock implements QuizUtil {}

void main() {

  testWidgets('Home Screen', (tester) async {

    var mock = MyMock();
    
    await tester.pumpWidget(MaterialApp(
      home:  HomeScreen(mock.startQuiz)
    ));

    final titleFinder = find.text("Harry Potter Quiz App");
    final startFinder = find.text("Start the Quiz");

    expect(titleFinder, findsOneWidget);
    expect(startFinder, findsOneWidget);

    // tap the start button and we should get a callback
    await tester.tap(startFinder);
    verify(mock.startQuiz()).called(1);
  });
}