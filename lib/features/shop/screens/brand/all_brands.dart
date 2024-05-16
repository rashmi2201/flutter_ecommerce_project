import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/t_brands_card.dart';
import 'package:flutter_ecommerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_ecommerce_project/common/widgets/sections/section_heading.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/brand_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/brand_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/brand/brand_products.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: const TAppBar(
        titlee: Text('Brand'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            //heading
            children: [
              const TSectionHeading(title: 'Brands'),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              //brands
              Obx(() {
                if (brandController.isLoading.value)
                  return const TBrandsShimmer(
                    itemCount: 4,
                  );

                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No data found!',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.red),
                    ),
                  );
                }

                return TGridLayout(
                    itemCount: brandController.allBrands.length,
                    mainAxisExtent: 80,
                    itemBuilder: (_, index) {
                      final brand = brandController.allBrands[index];

                      return TBrandCard(
                        showBorder: true,
                        brand: brand,
                        ontap: () => Get.to(() => BrandProducts(
                              brand: brand,
                            )),
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
