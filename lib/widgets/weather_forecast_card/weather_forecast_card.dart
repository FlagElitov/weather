import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather_forecast_card_model.dart';
import 'package:weather/widgets/item_widget.dart';
import 'card_bloc/card_bloc.dart';

class WeatherForecastCard extends StatelessWidget {
  final WeatherForecastCardModel model;

  WeatherForecastCard({required this.model});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CardBloc(),
      child: BlocBuilder<CardBloc, CardState>(
        builder: (context, state) {
          CardBloc cardProvider = BlocProvider.of<CardBloc>(context);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                cardProvider.add(ToggleArrowEvent());
              },
              child: Column(
                children: [
                  ItemWidget(
                    model: model,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
