import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_ecommerce_project/common/widgets/sections/section_heading.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/all_products/all_products.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/store/widgets/category_brands.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/text_strings.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProductController());
    final controller = CategoryController.instance;

    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            children: [
              //brands
              CategoryBrands(category: category),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),

              //products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    //Helper Function:handle loader,No record,or error meesage
                    final response =
                        TCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const TVerticalProductShimmer());
                    if (response != null) return response;

                    //record found!
                    final products = snapshot.data!;
                    return Column(
                      children: [
                        TSectionHeading(
                          title: TTexts.mightLike,
                          onPressed: () => Get.to(AllProducts(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                                categoryId: category.id,),
                          )),
                        ),
                        const SizedBox(
                          height: Tsized.spaceBtwItems,
                        ),
                        // TGridLayout(
                        //   itemCount: 8,
                        //   itemBuilder: (_, index) => TProductCardVertical(product:ProductModel.empty(),),
                        // ),
                        TGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) => TProductCardVertical(
                            product: products[index],
                          ),
                        ),
                      ],
                    );
                  }),

              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
