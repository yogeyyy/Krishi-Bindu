import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solution_challenge/features/authentication/controllers.onboarding/onboarding_controller.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_dot_navigation.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_next_button.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_page.dart';
import 'package:solution_challenge/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';
import 'package:solution_challenge/utils/constants/image_strings.dart';
import 'package:solution_challenge/utils/translator/translated_strings.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Horizontal scrollable page
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: translatedStrings?[0] ?? " Empowering Farmers Through Education",
                subTitle: translatedStrings?[1] ??
                    "Providing Comprehensive Education and Resources to Empower Farmers in Cultivating Sustainable Agriculture ",
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: translatedStrings?[2] ?? "Your Farming Companion" ,
                subTitle: translatedStrings?[3] ??
                      "Access Comprehensive Resources, Foster Vibrant Community Networks, and Cultivate Success Together",
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: translatedStrings?[4] ??
                      "EnablingFarmers for Sustainable Growth with a community",
                subTitle: translatedStrings?[5] ??
                      "Access Comprehensive Resources, Foster Vibrant Community Networks, and Cultivate Success Together",
              ),
            ],
          ),

          /// Skip button
          const OnBoardingSkip(),

          /// Dot navigation smooth page indicator
          const OnBoardingDotNavigation(),

          /// Circular button
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}