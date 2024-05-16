import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/brand_show_case.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/boxes_shimmer.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/list_tile_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/brand_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  CategoryBrands({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
      future: controller.getBrandsForCategory(category.id),
      builder: (context, snapshot) {
        // Handle Loder,No Record,OR Error Message
        final loader = Column(
          children: [
            TListTileShimmer(),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            const TBoxesShimmer(),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
          ],
        );
        final widget = TCloudHelperFunctions.checkMultiRecordState(
            snapshot: snapshot, loader: loader);
        if (widget != null) return widget;

        //Record found!
        final brands = snapshot.data!;

        return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    //Handle loader,no record,or error message
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    //record found!
                    final products = snapshot.data!;

                    return TBrandShowcase(
                        brand: brand,
                        images: products.map((e) => e.thumbnail).toList());
                  });
            });
      },
    );
  }
}
