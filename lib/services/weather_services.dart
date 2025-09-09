import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather/models/weather_model.dart';

class WeatherServices {
  final String apiKey = 'd7a911cbdea4de965b55aba52e3e3f6e';

  Future<Weather> fetchWeather(String cityName) async {
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric',
    );

    final response = await http.get(url);

    if (response.statusCode == 200) {
      // agar API sahi data de rahi hai
      return Weather.fromJson(json.decode(response.body));
    } else {
      
      final error = json.decode(response.body);
      throw Exception(error['message'] ?? 'Failed to load weather data');
    }
  }
}
