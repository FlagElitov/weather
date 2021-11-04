import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather_forecast_card_model.dart';
import 'package:weather/widgets/column_widget.dart';
import 'package:weather/widgets/weather_forecast_card/card_bloc/card_bloc.dart';

class ItemWidget extends StatelessWidget {
  final WeatherForecastCardModel model;

  ItemWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    CardBloc cardProvider = BlocProvider.of<CardBloc>(context);

    return Stack(
      children: [
        Container(
          height: cardProvider.down ? 154 : 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: ColumnsWidget(
            model: model,
          ),
        ),
      ],
    );
  }
}
