import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StoryButton extends StatelessWidget {
  const StoryButton(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressed});

  final String? text;
  final Color color;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: text != null,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor: MaterialStatePropertyAll(
                color
            ),
            textStyle: const MaterialStatePropertyAll(
              TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              )
            )

          ),
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(text ?? ""),
          ),
        ),
      ),
    );
  }
}
