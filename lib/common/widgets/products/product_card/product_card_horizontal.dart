import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/cart/favourite_icon/favourite_icon.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/product_card/product_price_text.dart';
import 'package:flutter_ecommerce_project/common/widgets/texts/product_title_text.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/enums.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TProductCardHorizontal extends StatelessWidget {
  const TProductCardHorizontal({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isDarkMode(context);

    final controller = ProductController.instance;
    final salePercentage =
        controller.calculatesalePercentage(product.price, product.salePrice);
    return Container(
      width: 310,
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        // boxShadow: [TShadowStyle.verticalProductShadow],
        borderRadius: BorderRadius.circular(Tsized.productImageRadius),
        color: dark ? TColors.darkGrey : TColors.lightContainer,
      ),
      child: Row(
        children: [
          //thumbnail
          TRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(Tsized.sm),
            backgroundColor: dark ? TColors.dark : TColors.light,
            child: Stack(
              children: [
                //thumbnail image
                SizedBox(
                  height: 120,
                  width: 120,
                  child: TRoundedImage(
                    imageURL: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),
                ),
                //sale tag
                if (salePercentage != null)
                  Positioned(
                    top: 12,
                    child: TRoundedContainer(
                      radius: Tsized.sm,
                      backgroundColor: TColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(
                          horizontal: Tsized.sm, vertical: Tsized.xs),
                      child: Text(
                        '$salePercentage%',
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge!
                            .apply(color: TColors.black),
                      ),
                    ),
                  ),

                Positioned(
                  top: 0,
                  right: 0,
                  child: TFavouriteIcon(
                    productId: product.id,
                  ),
                )
              ],
            ),
          ),

          //details
          SizedBox(
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: Tsized.sm, left: Tsized.sm),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TProductTitleText(
                        title: product.title,
                        smallsize: true,
                      ),
                      SizedBox(
                        height: Tsized.spaceBtwItems / 2,
                      ),
                      TBrandTitleWithVerifiedIcon(title: product.brand!.name)
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //price
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType ==
                                    ProductType.single.toString() &&
                                product.salePrice > 0)
                              Padding(
                                  padding: EdgeInsets.only(left: Tsized.sm),
                                  child: Text(
                                    product.price.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  )),

                            //price,show sale price as main price as exists
                            Padding(
                              padding: EdgeInsets.only(left: Tsized.sm),
                              child: TProductPriceText(
                                price: controller.getProductprice(product),
                              ),
                            ),
                          ],
                        ),
                      ),

                      //add to cart button
                      Container(
                        decoration: const BoxDecoration(
                            color: TColors.dark,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(Tsized.cardRadiusMd),
                                bottomRight: Radius.circular(
                                    Tsized.productImageRadius))),
                        child: const SizedBox(
                            width: Tsized.iconLg * 1.2,
                            height: Tsized.iconLg * 1.2,
                            child: Center(
                                child: Icon(
                              Iconsax.add,
                              color: TColors.white,
                            ))),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
