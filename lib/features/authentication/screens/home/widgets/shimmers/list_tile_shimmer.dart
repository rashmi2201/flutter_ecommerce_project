import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/shimmer.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';

class TListTileShimmer extends StatelessWidget {
  TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            TShimmerEffect(
              width: 50,
              height: 50,
              radius: 50,
            ),
            SizedBox(
              width: Tsized.spaceBtwItems,
            ),
            Column(
              children: [
                TShimmerEffect(
                  width: 100,
                  height: 15,
                ),
                SizedBox(
                  width: Tsized.spaceBtwItems / 2,
                ),
                TShimmerEffect(
                  width: 80,
                  height: 12,
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
