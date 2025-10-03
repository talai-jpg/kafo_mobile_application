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
            style: TextStyle(
              fontSize: screenWidth * 0.04,
              fontWeight: FontWeight.bold,
              color: const Color(0xff1a3e2e),
            ),
          ),
          SizedBox(width: screenWidth * 0.17),
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
