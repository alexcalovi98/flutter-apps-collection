class WeatherModel {
  WeatherModel(this.city, this.temperature, this.condition);

  String city;
  int temperature;
  int condition;

  static WeatherModel of(String city, double temperature, int condition) {
    return WeatherModel(city, temperature.round(), condition);
  }

  String getWeatherIcon() {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage() {
    String message;
    if (temperature > 25) {
      message = "It's 🍦 time";
    } else if (temperature > 20) {
      message = "Time for shorts and 👕";
    } else if (temperature < 10) {
      message = "You\'ll need 🧣 and 🧤";
    } else {
      message = "Bring a 🧥 just in case";
    }
    return "$message in $city";
  }
}
