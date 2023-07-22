import 'package:bmi_calculator/theme.dart';
import 'package:bmi_calculator/components/button_bmi.dart';
import 'package:bmi_calculator/components/card_result_bmi.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(
      {super.key,
      required this.result,
      required this.bmi,
      required this.interpretation});

  final String result;
  final String bmi;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text("BMI Calculator"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text("Your Result",
                textAlign: TextAlign.center, style: AppTheme.kTitleTextStyle),
          ),
          CardResultBMI(
            result: result,
            bmi: bmi,
            interpretation: interpretation,
          ),
          ButtonBMI(
            text: "RE-CALCULATE",
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
