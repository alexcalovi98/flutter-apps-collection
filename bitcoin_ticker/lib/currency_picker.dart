import 'dart:io' show Platform;

import 'package:bitcoin_ticker/coin_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrencyPicker extends StatelessWidget {
  const CurrencyPicker(
      {super.key, required this.onChanged, required this.initialValue});

  final Function(String value) onChanged;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return IOSCurrencyPicker(
        onChanged: onChanged,
        initialValue: initialValue,
      );
    } else if (Platform.isAndroid) {
      return AndroidCurrencyPicker(
        onChanged: onChanged,
        initialValue: initialValue,
      );
    } else {
      throw Exception("Not supported platform");
    }
  }
}

class AndroidCurrencyPicker extends StatefulWidget {
  const AndroidCurrencyPicker(
      {super.key, required this.onChanged, required this.initialValue});

  final Function(String value) onChanged;
  final String initialValue;

  @override
  State<AndroidCurrencyPicker> createState() => _AndroidCurrencyPickerState();
}

class _AndroidCurrencyPickerState extends State<AndroidCurrencyPicker> {
  late String value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: value,
      items: currenciesList
          .map((e) => DropdownMenuItem<String>(value: e, child: Text(e)))
          .toList(),
      onChanged: (value) {
        if (value != null) {
          setState(() => this.value = value);
          widget.onChanged(value);
        }
      },
    );
  }
}

class IOSCurrencyPicker extends StatelessWidget {
  const IOSCurrencyPicker(
      {super.key, required this.onChanged, required this.initialValue});

  final Function(String value) onChanged;
  final String initialValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (int value) {
        onChanged(currenciesList[value]);
      },
      scrollController: FixedExtentScrollController(
        initialItem: currenciesList.indexOf(initialValue),
      ),
      children: currenciesList.map((e) => Text(e)).toList(),
    );
  }
}
