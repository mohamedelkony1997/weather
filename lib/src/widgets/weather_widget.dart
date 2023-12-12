// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weather/src/models/weateherModel.dart';

class WeatherWidget extends StatelessWidget {
  final Weather weather;

  WeatherWidget(this.weather);

  String getLottieAnimation() {
    // Map weather conditions to Lottie animation names
    switch (weather.weatherCondition.toLowerCase()) {
      case 'clear':
        return 'clear_day.json';
      case 'clouds':
        return 'cloudy.json';
      case 'rain':
        return 'rain.json';
      // Add more cases for other weather conditions
      default:
        return 'default_animation.json'; // Default animation for unknown conditions
    }
  }

  IconData getWeatherIcon() {
    // Map weather conditions to Flutter icons
    switch (weather.weatherCondition.toLowerCase()) {
      case 'clear':
        return Icons.wb_sunny;
      case 'clouds':
        return Icons.cloud;
      case 'rain':
        return Icons.beach_access; // You can choose a rain-related icon
      // Add more cases for other weather conditions
      default:
        return Icons.error; // Default icon for unknown conditions
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 20),
          Text(
            '${weather.city}',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${weather.weatherCondition}',
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 10),
          Text(
            '${weather.temperature} °C',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20),
          Lottie.asset(
            'assets/animations/${getLottieAnimation()}',
            height: 150,
            width: 150,
            fit: BoxFit.fill,
          ),
          Text(
            '5-Day Forecast',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: weather.forecasts.length,
              itemBuilder: (context, index) {
                final forecast = weather.forecasts[index];
                return ListTile(
                  title: Text(
                    '${forecast.date.toLocal()}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    '${forecast.temperature} °C, ${forecast.weatherCondition}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}