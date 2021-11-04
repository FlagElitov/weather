import 'package:intl/intl.dart';

class WeatherForecastCardModel {
  late num temperature;
  late String weather;
  late String weatherDescription;
  late String weatherIcon;
  late num windSpeed;
  late num clouds;
  late DateTime date;
  late WeatherForecastType weatherForecastType;

  WeatherForecastCardModel.fromJson(
      {required Map data, required WeatherForecastType type}) {
  
    this.temperature =
        type == WeatherForecastType.daily ? data["temp"]["day"] : data["temp"];
    this.weather = data["weather"][0]["main"];
    this.weatherDescription = data["weather"][0]["description"];
    this.weatherIcon = data["weather"][0]["icon"];
    this.windSpeed = data["wind_speed"];
    this.clouds = data["clouds"];
    
    this.date = DateTime.fromMillisecondsSinceEpoch(data['dt']);
    this.weatherForecastType = type;
  }
}

enum WeatherForecastType { daily, hourly }
