import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/data/banners/banner_repository.dart';
import 'package:flutter_ecommerce_project/data/repositories/brands/brand_repository.dart';
import 'package:flutter_ecommerce_project/data/repositories/product/product_repository.dart';
import 'package:flutter_ecommerce_project/data/services/dummy_data.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';

import 'data/categories/category_repository.dart';

class UploadImageToFirebase extends StatelessWidget {
  UploadImageToFirebase({super.key});
  final mycontroller = CategoryRepository.instance;
  final banner= BannerRepository.instance;
  final product= ProductRepository.instance;
  // final brand=BrandRepository.instance;
  final brand=Get.put(BrandRepository());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Data'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Main Record',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Padding(
                padding: const EdgeInsets.all(Tsized.spaceBtwItems),
                child: Column(
                  children: [
                    UplaodDataTile(
                      icon1: Icons.category,
                      text: 'Upload Categories',
                      ontapp:  () => mycontroller.uploadDummyData(TDummyData.categories),
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.storefront_outlined,
                      text: 'Upload brands',
                       ontapp:  () => brand.uploadBrandData(TDummyData.brands),
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.shopping_cart_outlined,
                      text: 'Upload Products',
                      ontapp: ()=>product.uploadProductData(TDummyData.product),
                    ),
                    const SizedBox(
                      height:Tsized.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.category,
                      text: 'Upload Banners',
                      ontapp:  () => banner.uploadBannerData(TDummyData.banners),
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwItems,
                    ),
                  
                  ],
                ),
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              Text(
                'Relationships',
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Make sure you have already uploaded all the content above',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .apply(color: Colors.black),
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              Padding(
                padding: const EdgeInsets.all(Tsized.spaceBtwItems),
                child: Column(
                  children: [
                    UplaodDataTile(
                      icon1: Icons.insert_link_sharp,
                      text: 'Upload Brands & \nCategories Relation Data',
                      ontapp: () {},
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwItems,
                    ),
                    UplaodDataTile(
                      icon1: Icons.insert_link_sharp,
                      text: 'Upload products \nCategories Relation Data',
                      ontapp: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}







class UplaodDataTile extends StatelessWidget {
  const UplaodDataTile({
    super.key,
    required this.text,
    required this.icon1,
    required this.ontapp,
  });

  final String text;
  final IconData icon1;
  final VoidCallback ontapp;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon1,
          size: 30,
          color: const Color.fromARGB(255, 63, 72, 141),
        ),
        const Spacer(
          flex: 2,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18),
        ),
        const Spacer(
          flex: 6,
        ),
        IconButton(onPressed: ontapp, icon: const Icon(Icons.upload, color:  Color.fromARGB(255, 63, 72, 141),))
      ],
    );
  }
}