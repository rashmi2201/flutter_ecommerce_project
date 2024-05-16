import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_circular_image.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter_ecommerce_project/features/shop/models/brand_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/enums.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
class TBrandCard extends StatelessWidget {
  const TBrandCard({
    super.key,
    this.ontap,
    required this.showBorder,
    required this.brand,
  });

  final BrandModel brand;
  final bool showBorder;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: TRoundedContainer(
        padding: const EdgeInsets.all(Tsized.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //icon
            Flexible(
                child: TCircularImage(
                  isNetworkImage: true,
              image: brand.image,
            )),
            const SizedBox(
              height: Tsized.spaceBtwItems / 1.5,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   TBrandTitleWithVerifiedIcon(
                    title: brand.name,
                    brandTextsize: Textsizes.large,
                  ),
                  Text(
                    '${brand.productsCount ?? 0} products',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
