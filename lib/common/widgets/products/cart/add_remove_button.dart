import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/icons/t_circular_icon.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:iconsax/iconsax.dart';

class TProductQuantitywithAddRemoveButton extends StatelessWidget {
  const TProductQuantitywithAddRemoveButton({
    super.key,
    required this.quantity,
    this.add,
    this.remove,
  });

  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TCircularIcon(
          icon: Iconsax.minus,
          height: 32,
          width: 32,
          size: Tsized.md,
          color: THelperfunctions.isDarkMode(context)
              ? TColors.white
              : TColors.black,
          backgroundColor: THelperfunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
          onPressed: remove,
        ),
        const SizedBox(
          width: Tsized.spaceBtwItems,
        ),
        Text(
          quantity.toString(),
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(
          width: Tsized.spaceBtwItems,
        ),
        TCircularIcon(
            icon: Iconsax.add,
            height: 32,
            width: 32,
            size: Tsized.md,
            color: TColors.white,
            backgroundColor: TColors.primary,
            onPressed: add),
      ],
    );
  }
}
