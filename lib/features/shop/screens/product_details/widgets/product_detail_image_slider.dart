import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/curved_edges/curved_edges_widgets.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/cart/favourite_icon/favourite_icon.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/images_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:get/get.dart';


class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperfunctions.isDarkMode(context);

    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return TCurvedEdgeswidgets(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                  padding: EdgeInsets.all(Tsized.productImageRadius * 2),
                  child: Center(child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: ()=>controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: TColors.primary,
                        ),
                      ),
                    );
                  }))),
            ),
            //image slider
            Positioned(
              right: 0,
              left: Tsized.defaultSpace,
              bottom: 30,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(
                    width: Tsized.spaceBtwItems,
                  ),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                        width: 80,
                        isNetworkImage: true,
                        backgroundColor: dark ? TColors.dark : TColors.white,
                        border: Border.all(
                            color: imageSelected
                                ? TColors.primary
                                : Colors.transparent),
                        padding: const EdgeInsets.all(Tsized.sm),
                        imageURL: images[index],
                        onPressed: ()=> controller.selectedProductImage.value=images[index],
                        );
                  }),
                ),
              ),
            ),

            //appbar
             TAppBar(
              showbackarrow: true,
              actions: [TFavouriteIcon(productId: product.id,)],
              titlee: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
