import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/cart/cart_item.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/product_card/product_price_text.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../common/widgets/products/cart/add_remove_button.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({super.key, this.showaddremoveButtons = true});

  final bool showaddremoveButtons;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
        shrinkWrap: true,
        itemCount: cartController.cartItems.length,
        separatorBuilder: (_, __) => const SizedBox(
          height: Tsized.spaceBtwSections,
        ),
        itemBuilder: (_, index) => Obx(() {
          final item = cartController.cartItems[index];

          return Column(
            children: [
              //cart item
              TCartItem(cartItem: item),
              if (showaddremoveButtons)
                const SizedBox(
                  height: Tsized.spaceBtwItems,
                ),

              //add remove button row with total price
              if (showaddremoveButtons)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        // extra space
                        SizedBox(
                          width: 50,
                        ),
                        //add remove Buttons
                        TProductQuantitywithAddRemoveButton(
                          quantity: item.quantity,
                          add: () => cartController.addOneToCart(item),
                          remove: () => cartController.removeOneFromCart(item),
                        ),
                      ],
                    ),
                    TProductPriceText(price: (item.price*item.quantity).toStringAsFixed(1)),
                  ],
                ),
            ],
          );
        }),
      ),
    );
  }
}
