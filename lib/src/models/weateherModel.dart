class Weather {
  final String city;
  final double temperature;
  final String weatherCondition;
  final List<Forecast> forecasts;

  Weather({
    required this.city,
    required this.temperature,
    required this.weatherCondition,
    required this.forecasts,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    // Parse daily forecasts from JSON and create Forecast objects
    List<Forecast> forecasts = (json['list'] as List)
        .map((forecastData) => Forecast.fromJson(forecastData))
        .toList();

    return Weather(
      city: json['city']['name'],
      temperature: forecasts.first.temperature, // You can use the temperature of the first forecast as the current temperature
      weatherCondition: forecasts.first.weatherCondition, // Use the weather condition of the first forecast
      forecasts: forecasts,
    );
  }
}

class Forecast {
  final DateTime date;
  final double temperature;
  final String weatherCondition;

  Forecast({
    required this.date,
    required this.temperature,
    required this.weatherCondition,
  });

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      date: DateTime.fromMillisecondsSinceEpoch(json['dt'] * 1000, isUtc: true),
      temperature: json['main']['temp'].toDouble(),
      weatherCondition: json['weather'][0]['main'],
    );
  }
}
