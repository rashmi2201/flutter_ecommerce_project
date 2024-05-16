import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/layouts/grid_layout.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/all_products_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    //initalize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);


    return Column(
      children: [
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
               value: controller.selectedSortOption.value,
               onChanged: (value) {
                //sort products based on the selected option
                controller.sortProducts(value!);
               },
            
            items: [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              'Newest',
              'Popularity'
            ]
                .map((option) =>
                    DropdownMenuItem(value: option, child: Text(option)))
                .toList(),
           ),
        const SizedBox(
          height: Tsized.spaceBtwSections,
        ),

        //products
        // TGridLayout(
        //     itemCount: 8, itemBuilder: (_, index) =>  TProductCardVertical(product: ProductModel.empty(),))
        Obx(
          () => TGridLayout(
            itemCount:controller.products.length,
            itemBuilder: (_, index) => TProductCardVertical(
              product: controller.products[index],
            ),
          ),
        ),
      ],
    );
  }
}
