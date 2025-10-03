import 'package:flutter/material.dart';
import 'package:kafo_app/features/complaints/screen/complaints/screen/splash_screen.dart';
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
      locale: const Locale('ar'),
      // تحديد اللغات المدعومة
      supportedLocales: const [Locale('ar', 'SA'), Locale('en', 'US')],

      // تفعيل مندوبي التوطين
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
