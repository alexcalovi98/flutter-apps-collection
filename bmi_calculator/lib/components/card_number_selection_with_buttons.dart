import 'package:bmi_calculator/theme.dart';
import 'package:bmi_calculator/components/card_bmi.dart';
import 'package:flutter/material.dart';

class CardNumberSelectionWithButtons extends StatefulWidget {
  const CardNumberSelectionWithButtons(
      {super.key,
      required this.title,
      required this.initialValue,
      required this.onChangeValue});

  final String title;
  final int initialValue;
  final Function(int value) onChangeValue;

  @override
  State<CardNumberSelectionWithButtons> createState() =>
      _CardNumberSelectionWithButtonsState();
}

class _CardNumberSelectionWithButtonsState
    extends State<CardNumberSelectionWithButtons> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CardBMI(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.title, style: AppTheme.kTextStyle),
          Text(value.toString(), style: AppTheme.kTextNumberStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RoundIconButton(
                icon: Icons.remove,
                onPressed: () {
                  setState(() {
                    value--;
                  });
                  widget.onChangeValue(value);
                },
              ),
              RoundIconButton(
                icon: Icons.add,
                onPressed: () {
                  setState(() {
                    value++;
                  });
                  widget.onChangeValue(value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  const RoundIconButton(
      {super.key, required this.onPressed, required this.icon});

  final Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: RawMaterialButton(
        onPressed: onPressed,
        constraints: const BoxConstraints.tightFor(width: 55, height: 55),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(55),
          ),
        ),
        elevation: 4.0,
        fillColor: AppTheme.kRoundIconButtonColor,
        child: Text(
          String.fromCharCode(icon.codePoint),
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            fontFamily: icon.fontFamily,
          ),
        ),
      ),
    );
  }
}
