
import 'package:quiz_app/models/state.dart';
import 'package:test/test.dart';

void main() {
  test('State model returns quiz questions', () {

    var testState = StateModel();

    expect(testState.questions.length, 6);

    expect(testState.getCurrentQuestion().questionText, startsWith("What"));
    
  });
}