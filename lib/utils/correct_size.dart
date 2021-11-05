import 'package:flutter/material.dart';


bool isTablet(BuildContext context) {
  final shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide >= 600;
}

bool isSmallDevice(BuildContext context) {
  final shortestSide = MediaQuery.of(context).size.shortestSide;
  return shortestSide <= 330;
}

double getFontSizeByScreen(BuildContext context, double fontSize) {
  final double width = MediaQuery.of(context).size.width;
  double tabletHeightValue = width * 0.0017;
  double midleHeightValue = width * 0.002;
  double smallHeightValue = width * 0.005;

  if (isTablet(context)) return tabletHeightValue + fontSize;
  if (isSmallDevice(context))
    return fontSize - smallHeightValue;
  else {
    if (width > 400) fontSize += midleHeightValue;
    return fontSize;
  }
}
