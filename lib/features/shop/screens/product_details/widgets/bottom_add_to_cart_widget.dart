import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller=CartController.instance;
    controller.updateAlreadyAddedProductCount(product);


    final dark = THelperfunctions.isDarkMode(context);

    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: Tsized.defaultSpace, vertical: Tsized.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(Tsized.cardRadiusLg),
          topRight: Radius.circular(Tsized.cardRadiusLg),
        ),
      ),
      child: Obx(
        ()=> Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
                children: [
                   TCircularIcon(
                    icon: Iconsax.minus,
                    color: Colors.black,
                    backgroundColor: TColors.darkGrey,
                    height: 40,
                    width: 40,
                    onPressed:()=>controller.productQuantityInCart.value<1?null:controller.productQuantityInCart.value-=1,
                  ),
                  const SizedBox(
                    width: Tsized.spaceBtwItems,
                  ),
                  Text(
                    controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  const SizedBox(
                    width: Tsized.spaceBtwItems,
                  ),
                   TCircularIcon(
                    icon: Iconsax.add,
                    color: Colors.black,
                    backgroundColor: TColors.darkGrey,
                    height: 40,
                    width: 40,
                    onPressed: ()=> controller.productQuantityInCart.value+=1,
                  ),
                ],
              ),
            
            ElevatedButton(
                onPressed: controller.productQuantityInCart.value<1?null:()=>controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(Tsized.md),
                  backgroundColor: TColors.black,
                  side: const BorderSide(color: TColors.black),
                ),
                child: const Text('Add to Cart'))
          ],
        ),
      ),
    );
  }
}
