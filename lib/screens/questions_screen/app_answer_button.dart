import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget{
  const AnswerButton({super.key, required this.answerText, required this.onAnswerSelect});

  final String answerText;
  final void Function() onAnswerSelect;

  @override
  Widget build(context) {
    return ElevatedButton(
            onPressed: onAnswerSelect, 
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 35,
              ),
              foregroundColor: const Color(0xffF2D3AC),
              backgroundColor: const Color(0xff401201),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)
              )
            ),
            child: Text(
              answerText, 
              textAlign: TextAlign.center,)
          );
  }
}