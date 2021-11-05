import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/global_bloc.dart';
import 'package:weather/core/theme.dart';
import '../home.dart';
import 'package:easy_localization/easy_localization.dart';

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String lang = context.locale.toString();
    return BlocProvider(
      create: (context) => GlobalBloc()..add(InitStateEvent(lang: lang)),
      child: MaterialApp(
        title: 'Weather',
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.theme,
        home: MyHomeScreen(),
      ),
    );
  }
}
