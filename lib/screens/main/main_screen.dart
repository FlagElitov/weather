import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/global_bloc.dart';
import 'package:weather/widgets/weather_forecast_card/weather_forecast_card.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        GlobalBloc bloc = BlocProvider.of<GlobalBloc>(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('Main Page'),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemCount: bloc.weatherForecast.dailyForecasts.length,
            itemBuilder: (context, i) => WeatherForecastCard(
              model: bloc.weatherForecast.dailyForecasts[i],
            ),
          ),
        );
      },
    );
  }
}
