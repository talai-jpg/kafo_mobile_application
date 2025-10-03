import 'package:flutter/material.dart';
import 'package:kafo_app/features/onboarding/onboarding_screens.dart';
import 'dart:async';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _showText = false;
  bool _showLogo = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 600), () {
      setState(() => _showText = true);
    });

    Future.delayed(Duration(milliseconds: 1500), () {
      setState(() => _showLogo = true);
    });

    Timer(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1a3e2e),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _showText ? 1.0 : 0.0,
              duration: Duration(milliseconds: 400),
              child: AnimatedSlide(
                duration: Duration(milliseconds: 400),
                offset: _showText ? Offset(0, 0) : Offset(0, 1),
                child: Image.asset("assets/images/image1.png", width: 120),
              ),
            ),

            AnimatedOpacity(
              opacity: _showLogo ? 1.0 : 0.0,
              duration: Duration(milliseconds: 400),
              child: AnimatedSlide(
                duration: Duration(milliseconds: 400),
                offset: _showLogo ? Offset(0, 0) : Offset(0, 1),
                child: Image.asset("assets/images/image2.png", width: 80),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
