import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/global_bloc.dart';
import 'package:weather/utils/correct_size.dart';
import 'package:weather/widgets/weather_forecast_card/weather_forecast_card.dart';
import 'package:easy_localization/easy_localization.dart';

class MainBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    GlobalBloc provider = BlocProvider.of<GlobalBloc>(context);

    return provider.isLoading
        ? showDelay(context, provider.isEmptyCache)
        : ListView.builder(
            itemCount: provider.isDaily
                ? provider.weatherForecast!.dailyForecasts.length
                : provider.weatherForecast!.hourlyForecasts.length,
            itemBuilder: (context, i) => WeatherForecastCard(
              model: provider.isDaily
                  ? provider.weatherForecast!.dailyForecasts[i]
                  : provider.weatherForecast!.hourlyForecasts[i],
            ),
          );
  }
}

Widget showDelay(BuildContext context, bool isEmptyCache) {
  return isEmptyCache
      ? Center(
          child: Text(
            "checkInternetConnected".tr(),
            style: TextStyle(fontSize: getFontSizeByScreen(context, 19)),
          ),
        )
      : Center(
          child: CircularProgressIndicator(),
        );
}
