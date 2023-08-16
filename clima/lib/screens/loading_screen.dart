import 'package:clima/screens/location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/services/weather.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  LocationService locationService = LocationService();
  NetworkingService networkingService = NetworkingService();

  @override
  void initState() {
    super.initState();
    prepareDataLocationScreen();
  }

  Future<void> prepareDataLocationScreen() async {
    try {
      await locationService.detectPosition();
      WeatherModel weatherModel = await networkingService.getWeatherData(
          locationService.position.latitude,
          locationService.position.longitude
      );
      navigateToLocationScreen(weatherModel);
    } catch (e) {
      print(e);
    }
  }

  void navigateToLocationScreen(WeatherModel weatherModel) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LocationScreen(
          weatherModel: weatherModel,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
