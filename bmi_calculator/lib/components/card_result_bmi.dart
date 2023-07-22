import 'package:bmi_calculator/theme.dart';
import 'package:bmi_calculator/components/card_bmi.dart';
import 'package:flutter/material.dart';

class CardResultBMI extends StatelessWidget {
  const CardResultBMI(
      {super.key,
      required this.result,
      required this.bmi,
      required this.interpretation});

  final String result;
  final String bmi;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return CardBMI(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(result.toUpperCase(), style: AppTheme.kResultTextStyle),
          Text(bmi, style: AppTheme.kBMITextStyle),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(interpretation, textAlign: TextAlign.center, style: AppTheme.kBodyTextStyle),
          ),
        ],
      ),
    );
  }
}
