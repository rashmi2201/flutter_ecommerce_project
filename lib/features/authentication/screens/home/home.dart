import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_ecommerce_project/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/home_categories.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/home_appbar.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/promo_slider.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          //header
          const TPrimarHeaderContainer(
            child: Column(
              children: [
                //appbar
                THomeAppBar(),
                SizedBox(
                  height: Tsized.spaceBtwSections,
                ),

                //searchbar
                TSearchContainer(
                  text: 'Search in store',
                ),
                SizedBox(
                  height: Tsized.spaceBtwSections,
                ),

                //categories
                Padding(
                  padding: EdgeInsets.only(left: Tsized.defaultSpace),
                  child: Column(
                    children: [
                      //heading
                      TSectionHeading(
                        title: 'Popular Categories',
                        showActionButton: false,
                        textColor: TColors.white,
                      ),
                      SizedBox(
                        height: Tsized.spaceBtwItems,
                      ),
                      THomeCategories(),
                    ],
                  ),
                ),
                SizedBox(
                  height: Tsized.spaceBtwSections,
                ),

                //categories
              ],
            ),
          ),

          //body
          Padding(
            padding: const EdgeInsets.all(Tsized.defaultSpace),
            child: Column(
              children: [
                const TPromoSlider(),
                const SizedBox(
                  height: Tsized.spaceBtwSections,
                ),
                TSectionHeading(
                  title: 'Popular Products',
                  onPressed: () => Get.to(() => AllProducts(
                        title: 'Popular Products',
                        futureMethod: controller.fetchAllFeaturedProducts(),
                      )),
                ),
                const SizedBox(
                  height: Tsized.spaceBtwSections,
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const TVerticalProductShimmer();
                  }

                  if (controller.featuredProducts.isEmpty) {
                    return Center(
                      child: Text(
                        'No Data Found!',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    );
                  }

                  return TGridLayout(
                    itemCount: controller.featuredProducts.length,
                    itemBuilder: (_, index) => TProductCardVertical(
                      product: controller.featuredProducts[index],
                    ),
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
