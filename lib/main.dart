import 'package:flutter/material.dart';
import 'package:kafo_app/features/onboarding/onboarding_screens.dart';
import 'package:kafo_app/features/property/screen/property_screen.dart';
import 'package:kafo_app/features/reports/screen/reports_screen.dart';
import 'package:kafo_app/features/splash/splash_screen.dart';
import 'package:kafo_app/theme/app_theme.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Set default locale to Arabic for RTL support"
      locale: const Locale('ar'),
      // Specify supported languages
      supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],

      // Activate localization
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: SplashScreen(),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}
