import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/models/state.dart';
import 'package:quiz_app/screens/questions_screen/app_answer_button.dart';


class QuestionsScreen extends StatefulWidget {
  QuestionsScreen({super.key, required this.onSelectAnswer});

  void Function(String answer) onSelectAnswer;
  @override
  State<QuestionsScreen> createState() {
    return _QuestionsScreen();
  }
}

class _QuestionsScreen extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSelectAnswer(selectedAnswer);
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(context) {
    return Consumer<StateModel>(
      builder: (context, state, child) {

        var currentQuestion = state.getQuestion(currentQuestionIndex);
        return SizedBox(
          width: double.infinity,
          child: Container(
            margin: const EdgeInsets.all(60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Question ${currentQuestionIndex + 1}",
                  style: const TextStyle(
                    color: Color(0xff401201),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  currentQuestion.questionText,
                  style: const TextStyle(
                    color: Color(0xff401201),
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                  key: const Key('question-text'),
                ),
                const SizedBox(height: 30),
                ...currentQuestion.getShuffledAnswerList().map((answer) {
                  return AnswerButton(
                      answerText: answer,
                      onAnswerSelect: () {
                        answerQuestion(answer);
                      });
                }),
              ],
            ),
          ),
        );
      });
  }
}