import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/screens/results_screen/app_summary_section.dart';
import 'package:quiz_app/data/questions.dart';

import '../../models/state.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key});

  @override
  Widget build(context) {

    return Consumer<StateModel>( 
        builder: (context, state, child) {

          final summaryData = state.getSummaryData();
          final numOfQuestions = questions.length;
          final numOfCorrectAnswers = summaryData.where((data){
            return data['correctAnswer'] == data['chosenAnswer'];
          }).length;

          return SizedBox(
            width: double.infinity,
            child: Container(
              margin: const EdgeInsets.all(60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "You have answered $numOfCorrectAnswers out of $numOfQuestions Questions Correctly! ",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xff401201),  
                    ),
                    textAlign: TextAlign.center,),
                  const SizedBox(height: 30),
                  SummarySection(summaryData),
                  const SizedBox(height: 30),
                  TextButton(onPressed: state.resetQuiz, child: const Text("Restart Quiz"))
                ],
              ),
            ),
          );
        }
    );
  }
}
