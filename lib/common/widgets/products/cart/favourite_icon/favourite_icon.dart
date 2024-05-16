import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../../features/shop/controllers/product/favourite_controller.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () =>  TCircularIcon(
        icon: controller.isFavourite(productId)? Iconsax.heart5:Iconsax.heart,
        color: controller.isFavourite(productId)? TColors.error:Colors.black,
         onPressed: () => controller.toggleFavourite(productId),
        ));
   
  }
}
