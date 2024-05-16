import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/shimmer.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({super.key, this.itemCount = 4});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: Tsized.spaceBtwSections),
      height: 120,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) =>
            const SizedBox(width: Tsized.spaceBtwItems),
        itemCount: itemCount,
        itemBuilder: (_, __) => const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Image
            TShimmerEffect(width: 120, height: 120),
            SizedBox(width: Tsized.spaceBtwItems),

            //Text
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: Tsized.spaceBtwItems / 2),
                TShimmerEffect(width: 160, height: 15),
                SizedBox(width: Tsized.spaceBtwItems / 2),
                TShimmerEffect(width: 110, height: 15),
                SizedBox(width: Tsized.spaceBtwItems / 2),
                TShimmerEffect(width: 80, height: 15),
                Spacer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}