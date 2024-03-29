import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/app_quiz.dart';
import 'package:quiz_app/models/state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
         create: (context) => StateModel(),
         child: const Quiz()
    )
  );
}
