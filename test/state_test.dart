import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:quiz_app/models/state.dart';
import 'package:test/test.dart';
import 'state_test.mocks.dart';
import 'questions.dart';

@GenerateMocks([http.Client])
void main() {
  test('State model returns quiz questions', () {

    final client = MockClient();

    when(client.get(Uri.parse('https://stevecassidy.github.io/harry-potter-quiz-app/lib/data/questions.json')))
      .thenAnswer((_) async => http.Response(jsonEncode(questionsJson), 200));

    var testState = StateModel(client);

    testState.addListener(() {
      expect(testState.questions.length, 6);
      expect(testState.getCurrentQuestion().questionText, startsWith("What"));
    });
  });


  test('State model test status changes', () {
    
    final client = MockClient();

    when(client.get(Uri.parse('https://stevecassidy.github.io/harry-potter-quiz-app/lib/data/questions.json')))
      .thenAnswer((_) async => http.Response(jsonEncode(questionsJson), 200));

    var testState = StateModel(client);

    // need to track local state so that the listener below knows
    // what to check for whenever it is called
    var myState = 1;

    testState.addListener(() {
      // test depends on where we are
      if (myState == 1) {
        expect(testState.quizStatus, 'start');
        myState = 2;
        testState.startQuiz();
      } 
      if (myState == 2) {
        expect(testState.quizStatus, 'in-progress');
        myState = 3;
        testState.advanceQuestion();
      }
      if (myState == 3) {
        expect(testState.quizStatus, 'in-progress');
        myState = 4;
        // advance past the end
        testState.advanceQuestion();
        testState.advanceQuestion();
        testState.advanceQuestion();
        testState.advanceQuestion();
        testState.advanceQuestion();
      }
      if (myState == 4) {
        expect(testState.quizStatus, 'done');
      }
    });
  });
}