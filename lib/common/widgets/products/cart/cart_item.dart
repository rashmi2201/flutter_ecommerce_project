import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_ecommerce_project/common/widgets/texts/product_title_text.dart';
import 'package:flutter_ecommerce_project/features/shop/models/cart_item_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageURL: cartItem.image ?? '',
          width: 60,
          height: 60,
          isNetworkImage:true ,
          padding: const EdgeInsets.all(Tsized.sm),
          backgroundColor: THelperfunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(
          width: Tsized.spaceBtwSections,
        ),

        //title,price,size
        Expanded(
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                  child: TProductTitleText(
                title: cartItem.title,
                maxLines: 1,
              )),

              //attritube
              Text.rich(TextSpan(
                children: (cartItem.selectedVariation ?? {})
                    .entries
                    .map(
                      (e) => TextSpan(children: [
                        TextSpan(
                            text: '${e.key}',
                            style: Theme.of(context).textTheme.bodySmall),
                        TextSpan(
                            text: '${e.key}',
                            style: Theme.of(context).textTheme.bodyLarge),
                      ]),
                    )
                    .toList(),
              ))
            ])),
      ],
    );
  }
}
