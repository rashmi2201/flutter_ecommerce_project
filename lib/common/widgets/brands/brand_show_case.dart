import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/t_brands_card.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_container.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/models/brand_model.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/brand/brand_products.dart';

import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:get/get.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });

  final BrandModel brand;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(Tsized.md),
        margin: const EdgeInsets.only(bottom: Tsized.spaceBtwItems),
        child: Column(
          children: [
            TBrandCard(
              showBorder: false,
              brand: brand,
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),

            //brand top 3 product images
            Row(
              children: images
                  .map((image) => brandTopproductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}

Widget brandTopproductImageWidget(String image, context) {
  return Expanded(
      child: TRoundedContainer(
          height: 180,
          padding: const EdgeInsets.all(Tsized.md),
          margin: const EdgeInsets.only(right: Tsized.sm),
          backgroundColor: THelperfunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                TShimmerEffect(width: 108, height: 180),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )));
}
