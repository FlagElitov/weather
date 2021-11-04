import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/models/weather_forecast_card_model.dart';
import 'package:weather/utils/convert_date.dart';
import 'package:weather/widgets/weather_forecast_card/card_bloc/card_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class ColumnsWidget extends StatelessWidget {
  final WeatherForecastCardModel model;

  ColumnsWidget({required this.model});
  @override
  Widget build(BuildContext context) {
    final iconUrl = "http://openweathermap.org/img/w/${model.weatherIcon}.png";
    CardBloc cardProvider = BlocProvider.of<CardBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.network(
              iconUrl,
              height: 75,
              width: 75,
              fit: BoxFit.cover,
            ),
          ),
          _columnData(
            first: convertDate(model.date),
            firstName: "${"date".tr()}:",
            second: model.temperature.toString(),
            secondName: "${"temperature".tr()}:",
            third: model.weather.toString(),
            thirdName: "${"weather".tr()}:",
            down: cardProvider.down,
          ),
          _columnData(
            first: model.clouds.toString(),
            firstName: "${"cloudy".tr()}:",
            second: model.windSpeed.toString(),
            secondName: "${"windSpeed".tr()}:",
            third: model.weatherDescription.toString(),
            thirdName: "${"description".tr()}:",
            down: cardProvider.down,
          )
        ],
      ),
    );
  }
}

Widget _columnData(
    {required String first,
    required String firstName,
    required String second,
    required String secondName,
    required String third,
    required String thirdName,
    required bool down}) {
  return Container(
    width: 110,
    child: Column(
      children: [
        _textItem(
          name: firstName,
          indicator: first,
        ),
        SizedBox(
          height: 10,
        ),
        _textItem(
          name: secondName,
          indicator: second,
        ),
        if (down)
          Padding(
            padding: const EdgeInsets.only(top: 12.0),
            child: _textItem(
              name: thirdName,
              indicator: third,
            ),
          ),
      ],
    ),
  );
}

Widget _textItem({required String name, required String indicator}) {
  return Column(
    children: [
      Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white),
      ),
      Text(
        indicator.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white, fontSize: 13),
      ),
    ],
  );
}
