import 'package:bmi_calculator/components/card_bmi.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/theme.dart';

class MaleCardGender extends CardGender {
  const MaleCardGender(
      {super.key, required super.onGenderSelected, required super.color})
      : super(icon: Icons.male, text: "Male");
}

class FemaleCardGender extends CardGender {
  const FemaleCardGender(
      {super.key, required super.onGenderSelected, required super.color})
      : super(icon: Icons.female, text: "Female");
}

abstract class CardGender extends StatelessWidget {
  const CardGender(
      {super.key,
      required this.icon,
      required this.text,
      required this.onGenderSelected,
      this.color});

  final IconData icon;
  final String text;
  final Color? color;
  final Function() onGenderSelected;

  @override
  Widget build(BuildContext context) {
    return CardBMI(
      onTap: onGenderSelected,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 100.0),
          Text(
            text.toUpperCase(),
            style: AppTheme.kTextStyle
          ),
        ],
      ),
    );
  }
}
