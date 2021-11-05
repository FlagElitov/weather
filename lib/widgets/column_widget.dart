import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/global_bloc.dart';
import 'package:weather/models/weather_forecast_card_model.dart';
import 'package:weather/utils/convert_date.dart';
import 'package:weather/utils/correct_size.dart';
import 'package:weather/widgets/weather_forecast_card/card_bloc/card_bloc.dart';
import 'package:easy_localization/easy_localization.dart';

class ColumnsWidget extends StatelessWidget {
  final WeatherForecastCardModel model;

  ColumnsWidget({required this.model});
  @override
  Widget build(BuildContext context) {
    final iconUrl = "http://openweathermap.org/img/w/${model.weatherIcon}.png";
    CardBloc cardProvider = BlocProvider.of<CardBloc>(context);
    GlobalBloc globalProvider = BlocProvider.of<GlobalBloc>(context);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          globalProvider.isConnection
              ? Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: Image.network(
                    iconUrl,
                    height: getFontSizeByScreen(context, 75),
                    width: getFontSizeByScreen(context, 75),
                    fit: BoxFit.cover,
                  ),
                )
              : Container(
                  height: getFontSizeByScreen(context, 75),
                  width: getFontSizeByScreen(context, 75),
                  child: Image(
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
          _columnData(
            first: convertDate(model.date),
            firstName: "${"date".tr()}:",
            second: "${model.temperature.toString()}º",
            secondName: "${"temperature".tr()}:",
            third: model.weather.toString(),
            thirdName: "${"weather".tr()}:",
            down: cardProvider.down,
            context: context,
          ),
          _columnData(
            first: "${model.clouds.toString()}%",
            firstName: "${"cloudy".tr()}:",
            second: "${model.windSpeed.toString()}m",
            secondName: "${"windSpeed".tr()}:",
            third: model.weatherDescription.toString(),
            thirdName: "${"description".tr()}:",
            down: cardProvider.down,
            context: context,
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
    required bool down,
    required BuildContext context}) {
  return Column(
    children: [
      _textItem(
        context: context,
        name: firstName,
        indicator: first,
      ),
      SizedBox(
        height: 10,
      ),
      _textItem(
        context: context,
        name: secondName,
        indicator: second,
      ),
      if (down)
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: _textItem(
            context: context,
            name: thirdName,
            indicator: third,
          ),
        ),
    ],
  );
}

Widget _textItem(
    {required BuildContext context,
    required String name,
    required String indicator}) {
  return Column(
    children: [
      Text(
        name,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: getFontSizeByScreen(context, 14.5)),
      ),
      Text(
        indicator.toString(),
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: getFontSizeByScreen(context, 14)),
      ),
    ],
  );
}
