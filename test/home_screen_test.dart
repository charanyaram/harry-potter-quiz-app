import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/state.dart';
import 'package:quiz_app/screens/home_screen/app_home_screen.dart';
import 'package:http/http.dart' as http;
import 'questions.dart';
import 'state_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {

  testWidgets('Home Screen', (tester) async {
    
    final client = MockClient();

    when(client.get(Uri.parse('https://stevecassidy.github.io/harry-potter-quiz-app/lib/data/questions.json')))
      .thenAnswer((_) async => http.Response(jsonEncode(questionsJson), 200));

    await tester.pumpWidget(ChangeNotifierProvider(
         create: (context) => StateModel(client),
         child:const MaterialApp(
               home:  HomeScreen()
          )));

    final titleFinder = find.text("Harry Potter Quiz App");
    final startFinder = find.text("Start the Quiz");

    expect(titleFinder, findsOneWidget);
    expect(startFinder, findsOneWidget);

    // tap the start button should set quiz state to started
    await tester.tap(startFinder); 
  });
}