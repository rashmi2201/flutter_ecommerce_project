import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/store/widgets/category_tab.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/tappbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/t_brands_card.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_ecommerce_project/common/widgets/sections/section_heading.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/brand_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/brand_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/brand/all_brands.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/brand/brand_products.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:get/get.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        appBar: const TAppBar(
          titlee: Text('Store'),
        ),
        body: NestedScrollView(
            headerSliverBuilder: (_, innerBoxIsScrolled) {
              return [
                SliverAppBar(
                  toolbarHeight: 0,
                  automaticallyImplyLeading: false,
                  pinned: true,
                  backgroundColor: THelperfunctions.isDarkMode(context)
                      ? TColors.black
                      : TColors.white,
                  expandedHeight: 440,
                  flexibleSpace: Padding(
                    padding: const EdgeInsets.all(Tsized.defaultSpace),
                    child: ListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      children: [
                        //Search bar

                        const SizedBox(
                          height: Tsized.spaceBtwItems,
                        ),
                        const TSearchContainer(
                          text: 'Search In Store',
                          showBorder: true,
                          showBackground: false,
                        ),
                        const SizedBox(
                          height: Tsized.spaceBtwSections,
                        ),

                        // -- Featured Brands

                        TSectionHeading(
                          title: 'Featured Brands',
                          showActionButton: true,
                          onPressed: () =>
                              Get.to(() => const AllBrandsScreen()),
                        ),
                        const SizedBox(
                          height: Tsized.spaceBtwItems / 1.5,
                        ),
                        // -- Brands GRID
                        Obx(() {
                          if (brandController.isLoading.value)
                            return const TBrandsShimmer(
                              itemCount: 4,
                            );

                          if (brandController.featuredBrands.isEmpty) {
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
                              itemCount: brandController.featuredBrands.length,
                              mainAxisExtent: 80,
                              itemBuilder: (_, index) {
                                final brand =
                                    brandController.featuredBrands[index];

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

                  // Tabs -- Tutorial [section # 3 , Video 8]
                  bottom: TTabBar(
                    tabs: categories
                        .map((category) => Tab(child: Text(category.name)))
                        .toList(),
                  ),
                ),
              ];
            },
            //-- Body -- Tutorial [Section #3,Video # 8]
            body: TabBarView(
                children: categories
                    .map((category) => TCategoryTab(category: category))
                    .toList())),
      ),
    );
  }
}
