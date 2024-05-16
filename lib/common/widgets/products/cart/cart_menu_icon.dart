import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/cart/cart.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:iconsax/iconsax.dart';

class TCartCounter extends StatelessWidget {
  const TCartCounter({
    super.key,
  
    required this.iconColor,
  });

  final Color iconColor;

  @override
  Widget build(BuildContext context) {

    //get an instance of the cartcontroller
    final controller=Get.put(CartController());




    return Stack(
      children: [
        IconButton(
            onPressed: () => Get.to(() => const CartScreen()),
            icon: Icon(
              Iconsax.shopping_bag,
              color: iconColor,
            )),
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: TColors.black,
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
                ()=> Text(
                  controller.noOfCartItem.value.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: TColors.white, fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
