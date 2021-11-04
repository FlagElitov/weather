import 'package:weather/models/weather_forecast_card_model.dart';

class WeatherForecast {
  late List<WeatherForecastCardModel> dailyForecasts;
  late List<WeatherForecastCardModel> hourlyForecasts;

  WeatherForecast.fromJson(Map data) {
    this.dailyForecasts = data["daily"]
        .map<WeatherForecastCardModel>((dailyForecast) =>
            WeatherForecastCardModel.fromJson(
                data: dailyForecast, type: WeatherForecastType.daily))
        .toList();
    this.hourlyForecasts = data["hourly"]
        .map<WeatherForecastCardModel>((hourlyForecast) =>
            WeatherForecastCardModel.fromJson(
                data: hourlyForecast, type: WeatherForecastType.hourly))
        .toList() as List<WeatherForecastCardModel>;
  }
}
