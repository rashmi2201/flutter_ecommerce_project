import 'package:flutter/material.dart';

import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/product_card/product_card_horizontal.dart';
import 'package:flutter_ecommerce_project/common/widgets/sections/section_heading.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/horizontal_product_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controlller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        titlee: Text(category.name),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            children: [
              const TRoundedImage(
                imageURL: TImages.promoBanner2,
                width: double.infinity,
                height: null,
                applyImageRadius: true,
              ),
              const SizedBox(
                height: Tsized.spaceBtwSections,
              ),

              //sub-categories
              FutureBuilder(
                  future: controlller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    //handle loader,no record,or error message
                    const loader = THorizontalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    //record found
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: subCategories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        final subcategory = subCategories[index];

                        return FutureBuilder(
                            future: controlller.getCategoryProducts(
                                categoryId: subcategory.id),
                            builder: (context, snapshot) {
                              //handle loader,no record,or error message

                              final widget =
                                  TCloudHelperFunctions.checkMultiRecordState(
                                      snapshot: snapshot, loader: loader);
                              if (widget != null) return widget;

                              //Congrajulations record found.
                              final products = snapshot.data!;

                              return Column(
                                children: [
                                  //heading
                                  TSectionHeading(
                                    title: subcategory.name,
                                    onPressed: () => Get.to(() => AllProducts(
                                          title: subcategory.name,
                                          futureMethod:
                                              controlller.getCategoryProducts(
                                                  categoryId: subcategory.id,
                                                  ),
                                        )),
                                  ),
                                  const SizedBox(
                                    height: Tsized.spaceBtwSections / 2,
                                  ),

                                  SizedBox(
                                    height: 120,
                                    child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                              width: Tsized.spaceBtwItems,
                                            ),
                                        itemBuilder: (context, index) =>
                                             TProductCardHorizontal(product: products[index],)),
                                  ),
                                ],
                              );
                            });
                      },
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
