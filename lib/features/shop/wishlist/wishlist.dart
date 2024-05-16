import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_ecommerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_ecommerce_project/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/home.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/favourite_controller.dart';
import 'package:flutter_ecommerce_project/navigation_menu.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = FavouritesController.instance;

    //  final controller = Get.put(ProductController());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
            color: Colors.white,
          )
        ],
      ),
     body: SingleChildScrollView(
        padding: const EdgeInsets.all(Tsized.defaultSpace),

        //product grid
        child: Obx(
          () => FutureBuilder(
            future: controller.favouriteProducts(),
            builder: (context, snapshot) {
              //Nothing Found widget
              final emptywidget = TAnimationLoaderWidget(
                text: 'oops! whishlist is empty',
                animation: TImages.profileImage4,
                showAction: true,
                actionText: 'Lets\'s add some',
                onActionPressed: () => Get.off(() => NavigationMenu()),
              );

              const loader = TVerticalProductShimmer(
                itemCount: 6,
              );
              final widget = TCloudHelperFunctions.checkMultiRecordState(
                  snapshot: snapshot,
                  loader: loader,
                  nothingFound: emptywidget);
              if (widget != null) {
                return widget;
              }
              final products = snapshot.data!;
              return TGridLayout(
                itemCount: products.length,
                itemBuilder: (_, index) => TProductCardVertical(
                  product: products[index],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
