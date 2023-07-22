import 'package:bmi_calculator/models/bmi_calculator.dart';
import 'package:bmi_calculator/screens//result_page.dart';
import 'package:bmi_calculator/components/card_height.dart';
import 'package:bmi_calculator/components/card_number_selection_with_buttons.dart';
import 'package:bmi_calculator/components/gender_selector.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/button_bmi.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  int weight = 60;
  int height = 180;

  void navigateToResultPageWithBmiCalculator(BuildContext context, BMICalculator bmiCalculator) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ResultPage(
          result: bmiCalculator.result(),
          bmi: bmiCalculator.bmi(),
          interpretation: bmiCalculator.interpretation(),
        ),
      ),
    );
  }

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
          const GenderSelector(),
          CardHeight(
            initialHeight: height,
            onHeightChanged: (double h) {
              height = h.toInt();
            },
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CardNumberSelectionWithButtons(
                  title: "WEIGHT",
                  initialValue: weight,
                  onChangeValue: (int value) {
                    weight = value;
                  },
                ),
                CardNumberSelectionWithButtons(
                  title: "AGE",
                  initialValue: 30,
                  onChangeValue: (int value) {},
                ),
              ],
            ),
          ),
          ButtonBMI(
            text: "CALCULATE",
            onPressed: () {
              BMICalculator bmiCalculator = BMICalculator(weight, height);
              bmiCalculator.calculate();
              navigateToResultPageWithBmiCalculator(context, bmiCalculator);
            },
          ),
        ],
      ),
    );
  }
}
