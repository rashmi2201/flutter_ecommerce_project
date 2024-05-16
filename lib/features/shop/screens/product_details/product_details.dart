import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/sections/section_heading.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_details/widgets/bottom_add_to_cart_widget.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_details/widgets/product_attritube.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_details/widgets/product_detail_image_slider.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_details/widgets/product_meta_data.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_details/widgets/rating_share_widget.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_reviews/widgets/product_reviews.dart';
import 'package:flutter_ecommerce_project/utlis/constants/enums.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:  TBottomAddToCart(product:product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //product image slider
            TProductImageSlider(
              product: product,
            ),

            //product details
            Padding(
              padding: const EdgeInsets.only(
                  right: Tsized.defaultSpace,
                  left: Tsized.defaultSpace,
                  bottom: Tsized.defaultSpace),
              child: Column(
                children: [
                  //rating & share
                  const TRatingAndShare(),

                  //price- title- stack- brand

                  TProductMetaData(
                    product: product,
                  ),

                  //attribute
                  if (product.productType == ProductType.variable.toString())
                    TProductAttributes(product: product,),
                  if (product.productType == ProductType.variable.toString())
                    const SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),

                  //checkout R6TR
                  SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                      onPressed: () {}, child: const Text('Checkout'))),
                  const SizedBox(
                    height: Tsized.spaceBtwSections,
                  ),

                  //description
                  const TSectionHeading(
                    showActionButton: false,
                    title: 'Description',
                  ),
                  const SizedBox(
                    height: Tsized.spaceBtwSections,
                  ),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  //reviews
                  const Divider(),
                  const SizedBox(
                    height: Tsized.spaceBtwSections,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionHeading(
                        showActionButton: false,
                        title: 'Reviews(199)',
                        onPressed: () {},
                      ),
                      IconButton(
                        onPressed: () =>
                            Get.to(() => const ProductReviewsScreen()),
                        icon: const Icon(
                          Iconsax.arrow_right_3,
                          size: 18,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
