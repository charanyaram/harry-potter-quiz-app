import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(context) {
    return Consumer<StateModel>(
      
      builder: (context, state, child) {
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
                  onPressed: state.startQuiz,
                  label: const Text(
                    "Start the Quiz",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ))
            ],
          ),
        );
      });
    }
}
