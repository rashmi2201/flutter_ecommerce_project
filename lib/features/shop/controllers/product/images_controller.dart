

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';

class ImagesController extends GetxController {
  static ImagesController get instance => Get.find();

  //varibles
  RxString selectedProductImage = ''.obs;

  //--get all images from product and varitions
  List<String> getAllProductImages(ProductModel product) {
    //use set to add unique images only
    Set<String> images = {};

    //load thumbnail image
    images.add(product.thumbnail);

    //assign thumbnail as selected image
    selectedProductImage.value = product.thumbnail;

    //Get all images from the product model if not null
    if (product.images != null) {
      images.addAll(product.images!);
    }

    //get all images from the product variations if not null
    if (product.productVariations != null ||
        product.productVariations!.isNotEmpty) {
      images.addAll(
          product.productVariations!.map((variation) => variation.image));
    }
    return images.toList();
  }

  //-----Show image popup
  void showEnlargedImage(String image) {
    Get.to(
      fullscreenDialog: true,
      ()=>Dialog.fullscreen(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(padding: EdgeInsets.symmetric(
              vertical: Tsized.defaultSpace*2,horizontal: Tsized.defaultSpace,

            ),
            child: CachedNetworkImage(imageUrl: image),
            ),
            SizedBox(height: Tsized.spaceBtwSections,),
            Align(
              alignment: Alignment.bottomCenter,
              child:SizedBox(
                width: 150,
                child: OutlinedButton(onPressed: ()=>Get.back(), 
                child: Text('Close')),
              ),
            )

          ],

        ),
      )

    );

  }
}
