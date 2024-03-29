import 'package:flutter/material.dart';

class SummarySection extends StatelessWidget {
  const SummarySection(this.displayData, {super.key});

  final List<Map<String, Object>> displayData;

  bool isCorrectAnswer(String userInput, String correctAnswer) {
    return userInput == correctAnswer ? true : false;
  }

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: displayData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isCorrectAnswer(data['chosenAnswer'] as String,
                                data['correctAnswer'] as String)
                            ? const Color.fromARGB(100, 0, 255, 0)
                            : const Color.fromARGB(99, 255, 0, 0),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Text(
                        ((data['questionIndex'] as int) + 1).toString(),
                      )),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff0D0A09),
                          ),
                        ),
                        Text(
                          data['chosenAnswer'] as String,
                          style: const TextStyle(
                            color: Color(0xff732C02),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          data['correctAnswer'] as String,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff2C4001),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  )
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
