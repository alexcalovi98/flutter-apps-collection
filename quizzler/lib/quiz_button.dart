import 'package:flutter/material.dart';

class QuizButton extends StatelessWidget {

  final String text;
  final Color color;
  final Function() onPressed;

  const QuizButton({super.key, required this.text, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor:
            MaterialStatePropertyAll<Color>(color),
            foregroundColor:
            const MaterialStatePropertyAll<Color>(Colors.white),
          ),
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
