import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/bloc/global_bloc.dart';
import 'package:weather/screens/main/main_screen.dart';
import 'package:weather/screens/splash/splash_screen.dart';

class MyHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GlobalBloc, GlobalState>(
      builder: (context, state) {
        if (state is MainScreenState) return MainScreen();
        return SplashScreen();
      },
    );
  }
}
