import 'package:flutter/material.dart';

class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final double screenWidth;
  final double screenHeight;

  const OnboardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitle,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: screenHeight * 0.45,
              width: double.infinity,
              alignment: Alignment.topCenter,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
            Positioned(
              bottom: screenHeight * 0.001,
              right: screenWidth * 0.02,
              child: Text(
                title,
                textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
            ),
          ],
        ),
        SizedBox(height: screenHeight * 0.02),
        Text(
          subtitle,
          textAlign: TextAlign.right,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ],
    );
  }
}
