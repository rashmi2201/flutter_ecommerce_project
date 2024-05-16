import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_project/features/authentication/controllers/onboarding/onboarding_controller.dart';

import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';

import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/text_strings.dart';
import 'package:flutter_ecommerce_project/utlis/device/device_utility.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller =Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              
              OnBoardingPage(
                image: TImages.onBoardingImag1,
                title: TTexts.onBoardingSubTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImag2,
                title: TTexts.onBoardingSubTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImag3,
                title: TTexts.onBoardingSubTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),
          const OnBoardingskip(),
          const OnBoradingDotNavigation(),
          const OnBoardingNextbutton(),
        ],
      ),
    );
  }
}

class OnBoardingNextbutton extends StatelessWidget {
  const OnBoardingNextbutton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark =
        THelperfunctions.isDarkMode(context); // Get the dark mode status

    return Positioned(
      right: Tsized.defaultSpace,
      bottom: TDeviceUtils.getBottomNavigationBarHeight(),
      child: ElevatedButton(
        onPressed: ()=>OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          backgroundColor: dark ? TColors.primary : Colors.black,
        ),
        child: const Icon(Icons
            .arrow_right), // Use correct icon name and make sure it's imported
      ),
    );
  }
}

class OnBoradingDotNavigation extends StatelessWidget {
  const OnBoradingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=OnBoardingController.instance;
    final dark = THelperfunctions.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: Tsized.defaultSpace,
        child: SmoothPageIndicator(
            controller: controller.pageController,
            onDotClicked:controller.dotNavigationClick ,
            count: 3,
            effect: ExpandingDotsEffect(
                activeDotColor: dark ? TColors.light : TColors.dark,
                dotHeight: 6)));
  }
}

class OnBoardingskip extends StatelessWidget {
  const OnBoardingskip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: TDeviceUtils.getAppBarHeight(),
      right: Tsized.defaultSpace,
      child: TextButton(
        onPressed: ()=> OnBoardingController.instance.skipPage(),
        child: const Text('Skip'),
      ),
    );
  }
}

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Tsized.defaultSpace),
      child: Column(
        children: [
          Image(
            width: THelperfunctions.screenWeight() * 0.8,
            height: THelperfunctions.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title, // Corrected to access the title property
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: Tsized.spaceBetweenItems),
          Text(
            subTitle, // Corrected to access the subTitle property
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
