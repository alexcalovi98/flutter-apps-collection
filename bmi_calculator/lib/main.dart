import 'package:bmi_calculator/screens/input_page.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const BmiCalculatorApp());
}

class BmiCalculatorApp extends StatelessWidget {
  const BmiCalculatorApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.get(),
      home: const InputPage(),
    );
  }
}