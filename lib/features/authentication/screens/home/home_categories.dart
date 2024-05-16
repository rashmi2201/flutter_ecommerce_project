import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/image_text_widgets/vertical_image_text.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/category_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/store/sub_category/sub_category.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Obx(() {
      if (categoryController.isLoading.value) return const TCategoryShimmer();

      if (categoryController.featuredCategories.isEmpty) {
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
      return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return TVerticalImageText(
                image: category.image,
                title: category.name,
                ontap: () => Get.to(() =>   SubCategoriesScreen(category:category)),
              );
            }),
      );
    });
  }
}
