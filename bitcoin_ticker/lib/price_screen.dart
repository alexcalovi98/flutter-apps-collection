import 'package:bitcoin_ticker/coin_data.dart';
import 'package:bitcoin_ticker/currency_picker.dart';
import 'package:bitcoin_ticker/exchange_rate.dart';
import 'package:flutter/material.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = "EUR";

  Map<String, int> exchangeRatesByCrypto = {};

  @override
  void initState() {
    super.initState();
    _retrieveCoinData();
  }

  void _retrieveCoinData() async {
    Map<String, int> exchangeRatesByCrypto = {};
    for (String crypto in cryptoList) {
      exchangeRatesByCrypto[crypto] =
          await CoinData.getCoinData(crypto, selectedCurrency);
    }
    setState(() => this.exchangeRatesByCrypto = exchangeRatesByCrypto);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Coin Ticker'), backgroundColor: Colors.lightBlue),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: cryptoList
                .map(
                  (e) => ExchangeRate(
                    coin: e,
                    currency: selectedCurrency,
                    exchangeRate: exchangeRatesByCrypto[e] ?? 0,
                  ),
                )
                .toList(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CurrencyPicker(
              initialValue: selectedCurrency,
              onChanged: (value) {
                setState(() {
                  selectedCurrency = value;
                });
                _retrieveCoinData();
              },
            ),
          ),
        ],
      ),
    );
  }
}
