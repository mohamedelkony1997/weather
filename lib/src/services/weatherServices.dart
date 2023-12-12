// ignore_for_file: prefer_const_declarations

import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:weather/src/models/weateherModel.dart';


final weatherProvider = FutureProvider.autoDispose<Weather>((ref) async {
  final apiKey = "1923f2d60cd299a71a187dc6b5d05924";
  final city = "Alexandria"; 
 final apiUrl =
    "https://api.openweathermap.org/data/2.5/forecast?q=$city&appid=$apiKey&units=metric";

  final response = await http.get(Uri.parse(apiUrl));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return Weather.fromJson(data);
  } else {
    throw Exception('Failed to load weather data');
  }
});
