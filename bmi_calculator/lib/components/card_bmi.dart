import 'package:flutter/material.dart';

class CardBMI extends StatelessWidget {

  const CardBMI({
    super.key,
    this.child,
    this.color,
    this.onTap
  });

  final Widget? child;
  final Color? color;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          margin: const EdgeInsets.all(8.0),
          color: color,
          child: child ?? const Text("Empty"),
        ),
      ),
    );
  }
}
