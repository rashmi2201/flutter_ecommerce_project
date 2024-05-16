import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/brands/t_brands_card.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/brand_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/brand_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller=BrandController.instance;
    return  Scaffold(
      appBar: TAppBar(
        titlee: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Column(
          children: [
            //brand detail
            TBrandCard(showBorder: true, brand:brand,),
            const SizedBox(height: Tsized.spaceBtwSections,),

           FutureBuilder(
              future: controller.getBrandProducts(brandId: brand.id),
              builder: (context, snapshot) {

                //handle loader,no record,or rror message
                const loader=TVerticalProductShimmer();
                final widget=TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);
                if(widget!=null)return widget;

                //record found!
                final brandProducts=snapshot.data!;
                
                return  TSortableProducts(products: brandProducts,);
              }
            ),

          ],
        ),),
      ),
    );
  }
}