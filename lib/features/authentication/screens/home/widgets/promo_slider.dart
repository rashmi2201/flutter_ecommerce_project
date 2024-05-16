import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/banner_controller.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      //loader
      if (controller.isLoading.value)
        return const TShimmerEffect(width: double.infinity, height: 190);

      //No data found
      if (controller.banners.isEmpty) {
        return const Center(child: Text('No Data Found!'));
      } else {
        return Column(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatepageIndicator(index)),
              items: controller.banners
                  .map((banner) => TRoundedImage(
                        imageURL: banner.imageUrl,
                        isNetworkImage: true,
                        onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      TCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor:
                              controller.carousalCurrentIndex.value == i
                                  ? TColors.primary
                                  : TColors.grey),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}



//to fetch from firebase sample

/*
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/custom_shapes/containers/circular_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_image.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/category_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/banner_controller.dart';

import 'package:flutter_ecommerce_project/features/shop/controllers/home_controller.dart';

import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';

import '../../../../../utlis/constants/colors.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
    // required this.promobanners,
  });

  // final List<String> promobanners;

  @override
  Widget build(BuildContext context) {
    final myslidercontroller = Get.put(
      HomeController(),
    );
    final bannerController = Get.put(BannerController());

    return Obx(() {
      if (bannerController.isloading.value) return const TCategoryShimmer();

      if (bannerController.featuredbanners.isEmpty) {
        return Center(
          child: Text(
            'No Data Found!',
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: Colors.white),
          ),
        );
      }
      return Column(
        children: [
          CarouselSlider(
              options: CarouselOptions(
                viewportFraction: 1.5,
                onPageChanged: (index, _) =>
                    myslidercontroller.updatepageIndicator(index)),
            items: bannerController.featuredbanners.map((bannerModel) {
              return Builder(
                builder: (BuildContext context) {
                 return Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10),
                   child: TRoundedImage(isNetworkImage: true ,imageURL: bannerModel.image,),
                 );
                 
                },
              );
            }).toList(),
          ),
          const SizedBox(
            height: Tsized.spaceBtwItems,
          ),
          Center(
            child: Obx(
              () => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  for (int i = 0; i <  bannerController.featuredbanners.length; i++)
                    TCircularContainer(
                      margin: const EdgeInsets.only(right: 10),
                      width: 20,
                      height: 4,
                      backgroundColor:
                          myslidercontroller.carousalCurrentIndex.value == i
                              ? TColors.primary
                              : TColors.darkGrey,
                    ),
                ],
              ),
            ),
          )
        ],
      );
    });
  }
}
 */