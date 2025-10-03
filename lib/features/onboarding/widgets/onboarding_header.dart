import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  final double screenWidth;
  final double screenHeight;

  const OnboardingHeader({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: screenWidth * 0.05,
        vertical: 8,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "تسجيل الدخول",
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(width: screenWidth * 0.1),
          Image.asset(
            "assets/images/image3.png",
            width: screenWidth * 0.09,
            height: screenHeight * 0.07,
            fit: BoxFit.contain,
          ),
        ],
      ),
    );
  }
}
