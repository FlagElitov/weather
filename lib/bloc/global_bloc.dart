import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:weather/api/api.dart';
import 'package:weather/models/weather_forecast.dart';
import 'package:weather/utils/get_location.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(InitState());
  late WeatherForecast weatherForecast;
  late List<WeatherForecast> weatherForecasts;
  late LocationData locationData;
  late bool isDaily = false;

  @override
  Stream<GlobalState> mapEventToState(
    GlobalEvent event,
  ) async* {
    if (event is InitStateEvent) {
      Future.delayed(Duration(seconds: 3), () => {add(ShowMainScreenEvent())});
      locationData = await getLocation();
      Api.getWeatherForecast(
              lat: locationData.latitude,
              lon: locationData.longitude,
              lang: "ru")
          .then(
        (data) => this.weatherForecast = data,
      );
    }
    if (event is ShowMainScreenEvent) {
      yield MainScreenState();
    }
    if (event is ChangePeriodEvent) {
      isDaily = event.isDaily;
      yield MainScreenState();
    }
  }
}
