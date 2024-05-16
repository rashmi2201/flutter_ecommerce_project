import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/product_details/product_details.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/enums.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ProductCartAddToCartButton extends StatelessWidget {
  const ProductCartAddToCartButton({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return GestureDetector(
      onTap: () {
        //if the product have variations then show the product details for vaiation selections.
        // else add the product to the cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetailsScreen(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
            decoration: BoxDecoration(
                color:
                    productQuantityInCart > 0 ? TColors.primary : TColors.dark,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Tsized.cardRadiusMd),
                    bottomRight: Radius.circular(Tsized.productImageRadius))),
            child: SizedBox(
                width: Tsized.iconLg * 1.2,
                height: Tsized.iconLg * 1.2,
                child: productQuantityInCart > 0
                    ? Center(
                      child: Text(productQuantityInCart.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .apply(color: TColors.white)),
                    )
                    : const Icon(
                        Iconsax.add,
                        color: TColors.white,
                      )));
      }),
    );
  }
}
