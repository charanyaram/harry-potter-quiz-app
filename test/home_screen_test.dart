import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/state.dart';
import 'package:quiz_app/screens/home_screen/app_home_screen.dart';


void main() {

  testWidgets('Home Screen', (tester) async {
    
    await tester.pumpWidget(ChangeNotifierProvider(
         create: (context) => StateModel(),
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