import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/HP_Quiz_Logo.jpg',
            width: 300,
          ),
          const SizedBox(height: 30),
          const Text(
            "Harry Potter Quiz App",
            style: TextStyle(
              color: Color(0xff401201),
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
              icon: const Icon(Icons.arrow_right_alt_rounded),
              style: OutlinedButton.styleFrom(
                foregroundColor: const Color(0xff401201),  
              ),
              onPressed: startQuiz,
              label: const Text(
                "Start the Quiz",
                style: TextStyle(
                  fontSize: 16,
                ),
              ))
        ],
      ),
    );
  }
}
