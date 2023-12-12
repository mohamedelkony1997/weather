import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather/src/models/weateherModel.dart';
import 'package:weather/src/services/weatherServices.dart';
import 'package:weather/src/widgets/weather_widget.dart';


class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final weatherAsyncValue = ref.watch(weatherProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Weather App'),
      ),
      body: weatherAsyncValue.when(
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
        data: (weather) => WeatherWidget(weather as Weather),
      ),
     
    );
  }
}
