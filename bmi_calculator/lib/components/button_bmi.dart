import 'package:flutter/material.dart';

class ButtonBMI extends StatelessWidget {

  const ButtonBMI({
    super.key,
    required this.onPressed,
    required this.text
  });

  final Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 100.0,
        child: Card(
          color: const Color(0xFFF65269),
          child: Center(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
