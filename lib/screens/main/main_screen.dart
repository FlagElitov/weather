import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/global_bloc.dart';
import 'package:weather/widgets/dropdown_widget.dart';
import 'package:weather/widgets/weather_forecast_card/weather_forecast_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        GlobalBloc provider = BlocProvider.of<GlobalBloc>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Main Page'),
            centerTitle: true,
            actions: [
              DropDownWidget(
                dropDown: [
                  'Погодинно',
                  'Поденно',
                ],
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: provider.isDaily
                ? provider.weatherForecast.dailyForecasts.length
                : provider.weatherForecast.hourlyForecasts.length,
            itemBuilder: (context, i) => WeatherForecastCard(
              model: provider.isDaily
                  ? provider.weatherForecast.dailyForecasts[i]
                  : provider.weatherForecast.hourlyForecasts[i],
            ),
          ),
        );
      },
    );
  }
}
