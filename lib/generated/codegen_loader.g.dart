// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "windy": "Windy",
  "date": "Date",
  "temperature": "Temperature",
  "cloudy": "Cloudy",
  "windSpeed": "Wind Speed",
  "weather": "Weather",
  "description": "Description",
  "mainPage": "Main Page",
  "daily": "Daily",
  "hourly": "Hourly"
};
static const Map<String,dynamic> ru = {
  "windy": "Ветряно",
  "date": "Дата",
  "temperature": "Температура",
  "cloudy": "Облачно",
  "windSpeed": "Скорость ветра",
  "weather": "Погода",
  "description": "Описание",
  "mainPage": "Главная страница",
  "daily": "Ежедневно",
  "hourly": "Почасово"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "ru": ru};
}
