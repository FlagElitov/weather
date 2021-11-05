import 'package:weather/models/weather_forecast_card_model.dart';
import 'package:weather/utils/filter_daily.dart';

class WeatherForecast {
  late List<WeatherForecastCardModel> dailyForecasts = [];
  late List<WeatherForecastCardModel> hourlyForecasts = [];

  WeatherForecast.fromJson(Map data) {
    List filtersDaily = filterDaily(data: data['list']);
    this.dailyForecasts = filtersDaily
        .map<WeatherForecastCardModel>((dailyForecast) =>
            WeatherForecastCardModel.fromJson(data: dailyForecast))
        .toList();
    this.hourlyForecasts = data["list"]
        .map<WeatherForecastCardModel>((hourlyForecast) =>
            WeatherForecastCardModel.fromJson(data: hourlyForecast))
        .toList() as List<WeatherForecastCardModel>;
  }
}
