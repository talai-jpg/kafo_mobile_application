import 'package:flutter/material.dart';
import 'package:kafo_app/features/onboarding/widgets/onboarding_header.dart';
import 'package:kafo_app/features/onboarding/widgets/onboarding_page.dart';
import 'package:kafo_app/features/onboarding/widgets/onboarding_footer.dart';
import 'package:kafo_app/features/onboarding/widgets/onboarding_action.dart';
import 'package:kafo_app/features/onboarding/data/onboarding_data.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              OnboardingHeader(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: onboardingData.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.08,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OnboardingPage(
                            image: onboardingData[index]["image"],
                            title: onboardingData[index]["title"],
                            subtitle: onboardingData[index]["subtitle"],
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          OnboardingAction(
                            currentPage: _currentPage,
                            totalPages: onboardingData.length,
                            controller: _controller,
                            screenWidth: screenWidth,
                          ),
                          const Spacer(),
                          OnboardingFooter(
                            currentPage: _currentPage,
                            totalPages: onboardingData.length,
                            screenWidth: screenWidth,
                            screenHeight: screenHeight,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
