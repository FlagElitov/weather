import 'package:flutter/material.dart';
import 'package:weather/widgets/animate_logo.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: AnimatedInitialLogo()),
    );
  }
}
