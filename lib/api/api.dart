import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/models/weather_forecast.dart';

const String apiKey = "9a115df1df7a0eb09aa0a551f027ee68";

class Api {
  static Future<WeatherForecast> getWeatherForecast({
    double? lat = 51.507351,
    double? lon = -0.127758,
    required String lang,
  }) async {
    final String _url =
        "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,alerts,current&lang=$lang&appid=$apiKey";

    WeatherForecast result = WeatherForecast.fromJson(
        json.decode((await http.get(Uri.parse(_url))).body));

    return result;
  }
}
