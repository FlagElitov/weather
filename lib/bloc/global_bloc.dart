import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:weather/api/api.dart';
import 'package:weather/models/weather_forecast.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(InitState());
  late WeatherForecast weatherForecast;
  late List<WeatherForecast> weatherForecasts;
  late LocationData locationData;

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
    if (event is ShowSplashScreenEvent) {
      add(ShowMainScreenEvent());
    }
    if (event is ShowMainScreenEvent) {
      yield MainScreenState();
    }
  }
}

Future getLocation() async {
  Location location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
  _locationData = await location.getLocation();
  return _locationData;
}
