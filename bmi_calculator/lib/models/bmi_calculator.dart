import 'dart:math';

class BMICalculator {

  BMICalculator(this.weight, this.height);

  final int weight;
  final int height;

  late double _bmi;

  void calculate() {
    _bmi = weight / pow(height / 100, 2);
  }

  String bmi() => _bmi.toStringAsFixed(1);

  String result() {
    if(_bmi > 25) {
      return "Overweight";
    } else if (_bmi > 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String interpretation() {
    if(_bmi > 25) {
      return "You have a higher than normal body weight. Try to exercise more.";
    } else if (_bmi > 18.5) {
      return "You have a normal body weight. Good Job!";
    } else {
      return "You have a lower than normal body weight. You can eat a bit more.";
    }
  }
}