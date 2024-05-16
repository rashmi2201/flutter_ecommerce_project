import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/loaders/animation_loader.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/checkout/checkout.dart';
import 'package:flutter_ecommerce_project/navigation_menu.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;

    return Scaffold(
      appBar: TAppBar(
        showbackarrow: true,
        titlee: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        //nothing found widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is Empty.',
          animation: TImages.emptybaglottie,
          showAction: true,
          actionText: 'Let\'s fill it',
          onActionPressed: () => Get.off(() => const NavigationMenu()),
        );

        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return const SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(Tsized.defaultSpace),

              // items in cart
              child: TCartItems(),
            ),
          );
        }
      }),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? SizedBox()
          : Padding(
              padding: const EdgeInsets.all(Tsized.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => const CheckoutScreen()),
                  child: Obx(() =>
                      Text('Checkout \$${controller.totalCartPrice.value}'))),
            ),
    );
  }
}
