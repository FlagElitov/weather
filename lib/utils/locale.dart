import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:weather/generated/codegen_loader.g.dart';

class AppLocale {
  static List<Locale> supportedLocales = [
    const Locale.fromSubtags(languageCode: "en"),
    const Locale.fromSubtags(languageCode: "ru"),
  ];

  static List<LocalizationsDelegate> localizationsDelegates = [
    GlobalMaterialLocalizations.delegate,
  ];

  static Widget localize({required Widget app}) {
    return EasyLocalization(
      supportedLocales: supportedLocales,
      path: 'assets/locale/',
      useOnlyLangCode: true,
      fallbackLocale: supportedLocales[0],
      assetLoader: CodegenLoader(),
      child: app,
    );
  }
}
