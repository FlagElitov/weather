import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather_forecast_card_model.dart';
import 'package:weather/utils/convert_date.dart';
import 'package:weather/widgets/weather_forecast_card/card_bloc/card_bloc.dart';

class ItemWidget extends StatelessWidget {
  final WeatherForecastCardModel model;

  ItemWidget({required this.model});

  @override
  Widget build(BuildContext context) {
    final icon_url = "http://openweathermap.org/img/w/${model.weatherIcon}.png";
    CardBloc cardProvider = BlocProvider.of<CardBloc>(context);

    return Stack(
      children: [
        Container(
          height: cardProvider.down ? 150 : 100,
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
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Image.network(
                    icon_url,
                    height: 75,
                    width: 75,
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: [
                    _textItem(
                      name: "Date:",
                      indicator: convertDate(model.date),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    _textItem(
                      name: "Temperature:",
                      indicator: model.temperature.toString(),
                    ),
                  ],
                ),
                Column(
                  children: [
                    _textItem(
                      name: "Temperature:",
                      indicator: model.temperature.toString(),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        // _Arrow(down: cardProvider.down),
      ],
    );
  }
}

Widget _textItem({required String name, required String indicator}) {
  return Column(
    children: [
      Text(
        name,
        style: TextStyle(color: Colors.white),
      ),
      Text(
        indicator.toString(),
        style: TextStyle(color: Colors.white),
      ),
    ],
  );
}

class _Arrow extends StatelessWidget {
  final bool down;
  _Arrow({required this.down});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 5,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.white.withOpacity(0.5),
        ),
        child: Icon(
          down ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
          color: Colors.white,
          size: 25,
        ),
      ),
    );
  }
}
