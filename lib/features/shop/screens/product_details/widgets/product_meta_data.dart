import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/t_brand_title_text_with_verified_icon.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_circular_image.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/product_card/product_price_text.dart';
import 'package:flutter_ecommerce_project/common/widgets/texts/product_title_text.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/product_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/enums.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller=ProductController.instance;
    final salePercentage=controller.calculatesalePercentage(product.price, product.salePrice);
    // ignore: unused_local_variable
    final darkMode = THelperfunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price and sale price
        Row(
          children: [
            //sale tag

            TRoundedContainer(
              radius: Tsized.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(
                  horizontal: Tsized.sm, vertical: Tsized.xs),
              child: Text(
                '$salePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            const SizedBox(
              width: Tsized.spaceBtwItems,
            ),

            //price
            if(product.productType==ProductType.single.toString() && product.salePrice>0)
            Text(
              '\$${product.price}',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
           
           
            TProductPriceText(
              price: controller.getProductprice(product),
              isLarge: true,
            ),
          ],
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems / 1.5,
        ),

        //title
       TProductTitleText(
          title:product.title,
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems / 1.5,
        ),

        //stack status
        Row(
          children: [
            const TProductTitleText(
              title: 'Status ',
            ),
            const SizedBox(
              width: Tsized.spaceBtwItems,
            ),
            Text(
           controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems / 1.5,
        ),

        //brand
         Row(
          children: [
            TCircularImage(
              isNetworkImage: true,
              image:product.brand!=null? product.brand!.image:'',
              width: 45,
              height: 40,
            ),
            const SizedBox(
              width: Tsized.spaceBtwItems,
            ),
            TBrandTitleWithVerifiedIcon(
                title: product.brand!=null? product.brand!.name:'', brandTextsize: Textsizes.large),
          ],
        )
      ],
    );
  }
}
