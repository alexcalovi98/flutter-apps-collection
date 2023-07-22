import 'package:bmi_calculator/theme.dart';
import 'package:bmi_calculator/components/card_bmi.dart';
import 'package:flutter/material.dart';

class CardHeight extends StatefulWidget {

  const CardHeight({super.key, required this.initialHeight, required this.onHeightChanged});

  final int initialHeight;
  final Function(double h) onHeightChanged;

  @override
  State<CardHeight> createState() => _CardHeightState();
}

class _CardHeightState extends State<CardHeight> {

  late int height;

  @override
  void initState() {
    super.initState();
    height = widget.initialHeight.toInt();
  }

  @override
  Widget build(BuildContext context) {
    return CardBMI(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("HEIGHT", style: AppTheme.kTextStyle),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(height.toString(), style: AppTheme.kTextNumberStyle),
              const Text("cm", style: AppTheme.kTextStyle)
            ],
          ),
          Slider(
            value: height.toDouble(),
            min: 120,
            max: 200,
            onChanged: (double d) {
              setState(() {
                height = d.toInt();
              });
              widget.onHeightChanged(d);
            },
            activeColor: AppTheme.kSliderActiveColor,
          ),
        ],
      ),
    );
  }
}
