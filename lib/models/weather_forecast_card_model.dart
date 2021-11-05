class WeatherForecastCardModel {
  late num temperature;
  late String weather;
  late String weatherDescription;
  late String weatherIcon;
  late num windSpeed;
  late num clouds;
  late DateTime date;

  WeatherForecastCardModel.fromJson({required Map data}) {
    this.temperature = data["main"]["temp"];
    this.weather = data["weather"][0]["main"];
    this.weatherDescription = data["weather"][0]["description"];
    this.weatherIcon = data["weather"][0]["icon"];
    this.windSpeed = data["wind"]['speed'];
    this.clouds = data["clouds"]["all"];
    this.date = DateTime.parse(data['dt_txt']);
  }
}
