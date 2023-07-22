import 'package:flutter/material.dart';

class AppTheme {

  static const kPrimaryColor = Color(0xFF0A0E21);
  static const kPrimaryColorLight = Color(0xFF1F2033);
  static const kActiveColor = Color(0xFF353345);
  static const kSliderActiveColor = Color(0xFFEB1555);
  static const kRoundIconButtonColor = Color(0xFF4C4F5E);

  static const kTextStyle = TextStyle(
      color: Color(0xFF6E6F83),
      fontSize: 24,
      fontWeight: FontWeight.bold
  );

  static const kTextNumberStyle = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.w800
  );

  static const kTitleTextStyle = TextStyle(
    fontSize: 50,
    fontWeight: FontWeight.bold,
  );

  static const kResultTextStyle = TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Color(0xFF24D876)
  );

  static const kBMITextStyle = TextStyle(
      fontSize: 100,
      fontWeight: FontWeight.bold,
  );

  static const kBodyTextStyle = TextStyle(
    fontSize: 22
  );

  static ThemeData get() {
    return ThemeData.dark().copyWith(
        colorScheme: const ColorScheme.dark().copyWith(
          primary: kPrimaryColor,
        ),
        scaffoldBackgroundColor: kPrimaryColor,
        cardColor: kActiveColor
    );
  }
}