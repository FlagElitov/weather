import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/models/weather_forecast.dart';

Future<WeatherForecast?> getCache() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (prefs.containsKey("weatherForecast")) {
    String giveWeather = prefs.getString("weatherForecast")!;
    return WeatherForecast.fromJson({"list": jsonDecode(giveWeather)});
  }
}

Future<List> setCache(WeatherForecast data) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  List encodeHourly = data.hourlyForecasts.map((data) {
    return {
      "clouds": {"all": data.clouds},
      "dt_txt": data.date.toString(),
      "main": {"temp": data.temperature},
      "weather": [
        {
          "icon": data.weatherIcon,
          "description": data.weatherDescription,
          "main": data.weather
        }
      ],
      "wind": {"speed": data.windSpeed}
    };
  }).toList();

  prefs.setString("weatherForecast", jsonEncode(encodeHourly));

  return [];
}
