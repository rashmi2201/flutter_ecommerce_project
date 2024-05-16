import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/chips/choice_chip.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/product_card/product_price_text.dart';
import 'package:flutter_ecommerce_project/common/widgets/sections/section_heading.dart';
import 'package:flutter_ecommerce_project/common/widgets/texts/product_title_text.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:get/get.dart';
// ignore: unused_import

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(VariationController());
    final dark = THelperfunctions.isDarkMode(context);

    return Obx(
      ()=> Column(
        children: [
          //selected attribute pricing
          //display variation price and stock when same variation is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
            TRoundedContainer(
              padding: const EdgeInsets.all(Tsized.md),
              backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
              child: Column(
                children: [
                  Row(
                    children: [
                      const TSectionHeading(
                        // buttonTitle:
                        title: 'Variation',
                        showActionButton: false,
                      ),
                      const SizedBox(
                        width: Tsized.spaceBtwItems,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Price :',
                                smallsize: true,
                              ),
      
                              //actual price
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration: TextDecoration.lineThrough),
                                ),
                              const SizedBox(
                                width: Tsized.spaceBtwItems,
                              ),
                              //sale price
                              TProductPriceText(
                                  price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              const TProductTitleText(
                                title: 'Stock :',
                                smallsize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
                                style: Theme.of(context).textTheme.titleMedium,
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  //variation description
                   TProductTitleText(
                    title:
                     controller.selectedVariation.value.description ?? '',
                    smallsize: true,
                    maxLines: 4,
                  )
                ],
              ),
            ),
          const SizedBox(
            height: Tsized.spaceBtwItems,
          ),
      
          //attributes
      
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionHeading(
                          showActionButton: false, title: attribute.name ?? ''),
                      const SizedBox(
                        height: Tsized.spaceBtwItems / 2,
                      ),
                      Obx(
                        () => Wrap(
                          spacing: 8,
                          children: attribute.values!.map((attributeValues) {
                            final isSelected =
                                controller.selectedAttributes[attribute.name] ==
                                    attributeValues;
                            final available = controller
                                .getAttributesAvailabilityInVariation(
                                    product.productVariations!, attribute.name!)
                                .contains(attributeValues);
      
                            return TChoiceChip(
                                text: attributeValues,
                                selected: isSelected,
                                onSelected: available
                                    ? (selected) {
                                        if (selected && available) {
                                          controller.onAttributeSelected(
                                              product,
                                              attribute.name ?? '',
                                              attributeValues);
                                        }
                                      }
                                    : null);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
