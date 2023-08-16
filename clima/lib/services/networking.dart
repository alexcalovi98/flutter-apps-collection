import 'dart:convert';
import 'package:clima/services/weather.dart';
import 'package:http/http.dart' as http;

class NetworkingService {
  static const String _kAuthority = "api.openweathermap.org";
  static const String _kBasePath = "/data/2.5/";
  static const String _kAppId = "8cc6bb3b689fe09035bb8765df30c484";

  static const String _kUnits = "metric";

  Future<WeatherModel> getWeatherData(double lat, double lon) async {
    final queryParams = <String, String>{
      "lat": lat.toString(),
      "lon": lon.toString(),
      "units": _kUnits,
      "appid": _kAppId
    };

    Uri uri = Uri.https(_kAuthority, "${_kBasePath}weather", queryParams);
    http.Response response = await http.get(uri);

    if(response.statusCode != 200) {
      return Future.error("The status code of get weather data is not 200");
    }

    dynamic json = jsonDecode(response.body);
    return WeatherModel.of(json["name"], json["main"]["temp"], json["weather"][0]["id"]);
  }

  Future<WeatherModel> getWeatherDataByCity(String city) async {
    final queryParams = <String, String>{
      "q": city,
      "units": _kUnits,
      "appid": _kAppId
    };

    Uri uri = Uri.https(_kAuthority, "${_kBasePath}weather", queryParams);
    http.Response response = await http.get(uri);

    if(response.statusCode != 200) {
      return Future.error("The status code of get weather data by city is not 200");
    }

    dynamic json = jsonDecode(response.body);
    return WeatherModel.of(json["name"], json["main"]["temp"], json["weather"][0]["id"]);
  }
}
