import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';


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
