import 'package:clima/screens/city_screen.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:clima/utilities/constants.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key, required this.weatherModel});

  final WeatherModel weatherModel;

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  LocationService locationService = LocationService();
  NetworkingService networkingService = NetworkingService();

  late WeatherModel weatherModel;

  @override
  void initState() {
    super.initState();
    weatherModel = widget.weatherModel;
  }

  Future<void> refreshLocationAndWeather() async {
    try {
      await locationService.detectPosition();
      WeatherModel weatherModel = await networkingService.getWeatherData(
          locationService.position.latitude,
          locationService.position.longitude);
      setState(() {
        this.weatherModel = weatherModel;
      });
    } catch (e) {
      print(e);
    }
  }

  void navigateToCityScreen() async {
    String? cityNameSelected = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CityScreen(),
      ),
    );
    if(cityNameSelected != null) {
      try {
        WeatherModel weatherModel = await networkingService.getWeatherDataByCity(cityNameSelected);
        setState(() {
          this.weatherModel = weatherModel;
        });
      } catch (e) {
        print(e);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: const AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(
                    iconSize: 50.0,
                    onPressed: refreshLocationAndWeather,
                    icon: const Icon(
                      Icons.near_me,
                    ),
                  ),
                  IconButton(
                    iconSize: 50.0,
                    onPressed: navigateToCityScreen,
                    icon: const Icon(
                      Icons.location_city,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      "${weatherModel.temperature}°",
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherModel.getWeatherIcon(),
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Text(
                  weatherModel.getMessage(),
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
