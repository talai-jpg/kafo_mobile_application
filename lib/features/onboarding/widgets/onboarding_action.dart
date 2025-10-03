import 'package:flutter/material.dart';
import 'package:kafo_app/features/home/screen/home_screen.dart';

class OnboardingAction extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final PageController controller;
  final double screenWidth;

  const OnboardingAction({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.controller,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: InkWell(
        onTap: () {
          if (currentPage == totalPages - 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } else {
            controller.nextPage(
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Container(
          width: screenWidth * 0.13,
          height: screenWidth * 0.13,
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xff1a3e2e), width: 2),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.arrow_forward, color: Color(0xff1a3e2e)),
        ),
      ),
    );
  }
}
