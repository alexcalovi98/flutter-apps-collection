import 'package:flutter/material.dart';

class QuizFinishedDialog extends AlertDialog {

  final Function() onReset;

  QuizFinishedDialog({super.key, required this.onReset}) : super(
      title: const Text("Quiz finished"),
      content: const Text("Heyy, you just finished the quiz! Do you want to restart?"),
      actions: [
        TextButton(
          onPressed: onReset,
          child: const Text('Restart'),
        ),
      ]

  );
}