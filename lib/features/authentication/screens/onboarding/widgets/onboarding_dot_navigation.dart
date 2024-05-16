import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/device/device_utility.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoradingDotNavigation extends StatelessWidget {
  const OnBoradingDotNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isDarkMode(context);
    return Positioned(
        bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
        left: Tsized.defaultSpace,
        child: SmoothPageIndicator(
            controller: PageController(),
            count: 3,
            effect: ExpandingDotsEffect(
                activeDotColor: dark ? TColors.light : TColors.dark,
                dotHeight: 6)));
  }
}