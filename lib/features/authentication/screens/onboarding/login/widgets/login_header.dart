import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/text_strings.dart';

class TLoginHeader extends StatelessWidget {
  const TLoginHeader({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: Image.asset(
            dark
                ? "assets/logos/black1.png"
                : "assets/logos/white2.png",
            fit: BoxFit.contain,
          ),
        ),
        Text(
          TTexts.loginTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          height: Tsized.sm,
        ),
        Text(
          TTexts.loginSubtitle,
          style: Theme.of(context).textTheme.bodyMedium,
        )
      ],
    );
  }
}
