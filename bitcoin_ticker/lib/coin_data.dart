import 'dart:convert';

import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  static Future<int> getCoinData(String coin, String currency) {
    Uri url = Uri.https("rest.coinapi.io", "v1/exchangerate/$coin/$currency");
    return http.get(url, headers: {
      "X-CoinAPI-Key": "2E414F1B-7718-487E-9BB4-3358D6ABF756"
    }).then((value) {
      double? rate = jsonDecode(value.body)["rate"];
      return rate != null ? rate.ceil() : 0;
    });
  }
}
