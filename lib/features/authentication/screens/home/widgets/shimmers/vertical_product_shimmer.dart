import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/shimmer.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';

class TVerticalProductShimmer extends StatelessWidget {
  const TVerticalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        itemCount: itemCount,
        itemBuilder: (_, __) => const SizedBox(
              width: 180,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //image
                  TShimmerEffect(width: 180, height: 180),
                  SizedBox(
                    height: Tsized.spaceBtwItems,
                  ),

                  //text
                  TShimmerEffect(width: 160, height: 15),
                  SizedBox(
                    height: Tsized.spaceBtwItems / 2,
                  ),
                  TShimmerEffect(width: 110, height: 15),
                ],
              ),
            ));
  }
}
