import 'package:flutter/material.dart';
import 'package:quiz_app/app_summary_section.dart';
import 'package:quiz_app/data/questions.dart';


class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.collatedAnswers, required this.restartQuiz});

  final List<String> collatedAnswers;
  final void Function() restartQuiz;

  List<Map<String,Object>> getSummaryData(){
    List<Map<String,Object>> summaryData = [];

    for(var loopVariable=0; loopVariable < collatedAnswers.length; loopVariable++){
      summaryData.add({
        'questionIndex': loopVariable,
        'question': questions[loopVariable].questionText,
        'correctAnswer': questions[loopVariable].answersList[0],
        'chosenAnswer':collatedAnswers[loopVariable],
      });

    }
    return summaryData;
  }


  @override
  Widget build(context) {
    

    final summaryData = getSummaryData();
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
            TextButton(onPressed: restartQuiz, child: const Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}
