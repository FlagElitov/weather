import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather/app.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(WeatherApp());
}


