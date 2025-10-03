import 'package:flutter/material.dart';
import 'package:kafo_app/features/sign_up/screen/sign_up.dart';
import 'package:kafo_app/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Directionality(
        textDirection: TextDirection.rtl,
        child: SignUp(),
      ),
      theme: AppTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      
    );
  }
}
