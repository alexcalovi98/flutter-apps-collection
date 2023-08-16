import 'package:flutter/material.dart';

class ExchangeRate extends StatelessWidget {
  const ExchangeRate({
    super.key,
    required this.coin,
    required this.currency,
    required this.exchangeRate,
  });

  final String coin;
  final String currency;
  final int exchangeRate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
      child: Card(
        color: Colors.lightBlue,
        elevation: 5.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
          child: Text(
            "1 $coin = $exchangeRate $currency",
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
