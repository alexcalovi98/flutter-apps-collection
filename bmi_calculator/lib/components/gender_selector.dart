import 'package:bmi_calculator/models/gender.dart';
import 'package:bmi_calculator/theme.dart';
import 'package:bmi_calculator/components/card_gender.dart';
import 'package:flutter/material.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {

  Gender selectedGender = Gender.male;

  Color maleCardColor = AppTheme.kActiveColor;
  Color femaleCardColor = AppTheme.kPrimaryColorLight;

  void changeGender(Gender gender){
    selectedGender = gender;
    setState(() {
      switch(selectedGender) {
        case Gender.male:
          maleCardColor = AppTheme.kActiveColor;
          femaleCardColor = AppTheme.kPrimaryColorLight;
        case Gender.female:
          maleCardColor = AppTheme.kPrimaryColorLight;
          femaleCardColor = AppTheme.kActiveColor;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MaleCardGender(
            color: maleCardColor,
            onGenderSelected: () => changeGender(Gender.male),
          ),
          FemaleCardGender(
            color: femaleCardColor,
            onGenderSelected: () => changeGender(Gender.female),
          ),
        ],
      ),
    );
  }
}
