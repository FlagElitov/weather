import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:location/location.dart';
import 'package:meta/meta.dart';
import 'package:weather/api/api.dart';
import 'package:weather/models/weather_forecast.dart';
import 'package:weather/utils/cache.dart';
import 'package:weather/utils/get_location.dart';
import 'package:weather/utils/connection.dart';

part 'global_event.dart';
part 'global_state.dart';

class GlobalBloc extends Bloc<GlobalEvent, GlobalState> {
  GlobalBloc() : super(InitState());
  late WeatherForecast? weatherForecast;
  late LocationData? locationData;
  late String lang = "en";
  late bool isDaily = false;
  late bool isLoading = true;
  late bool isConnection = false;
  late bool isEmptyCache = false;
  final double latitude = 48.2785411;
  final double longitude = 25.9447455;

  @override
  Stream<GlobalState> mapEventToState(
    GlobalEvent event,
  ) async* {
    if (event is InitStateEvent) {
      this.lang = event.lang;
      navigatorOnMainPage();
      getAllData();
    }

    if (event is ShowMainScreenEvent) {
      yield MainScreenState();
    }
    if (event is ChangePeriodEvent) {
      isDaily = event.isDaily;
      yield MainScreenState();
    }
  }

  void navigatorOnMainPage() {
    Future.delayed(Duration(seconds: 3), () => {add(ShowMainScreenEvent())});
  }

  Future<void> tryGetCache() async {
    this.weatherForecast = await getCache();
    if (weatherForecast != null) isLoading = false;
    isEmptyCache = weatherForecast == null;
    navigatorOnMainPage();
  }

  Future<void> getAllData() async {
    try {
      this.locationData = await getLocation();
      this.isConnection = await checkConnection();

      if (this.isConnection) {
        Api.getWeatherForecast(
                lat: this.locationData == null
                    ? this.latitude
                    : this.locationData!.latitude,
                lon: this.locationData == null
                    ? this.longitude
                    : this.locationData!.longitude,
                lang: this.lang)
            .then(
          (data) async {
            this.weatherForecast = data;
            isLoading = false;
            setCache(weatherForecast!);
            navigatorOnMainPage();
          },
        );
      } else {
        await tryGetCache();
      }
    } catch (e) {
      tryGetCache();
    }
  }
}
