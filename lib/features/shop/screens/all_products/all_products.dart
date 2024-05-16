import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/sortable/sortable_products.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/vertical_product_shimmer.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/all_products_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    //initalize controller for managing product fetching
    final controller=Get.put(AllProductsController());
    return  Scaffold(
      appBar: TAppBar(
        titlee: Text(title),
        showbackarrow: true,
      ), 
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: FutureBuilder( 
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {
              
              //check the state of the futureBuilder snapshot
              const loader= TVerticalProductShimmer();
              final widget=TCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

              //return appropriate widget based on snapshot state
              if(widget!=null) return widget;
            
              //product found!
              final products=snapshot.data!;

             return TSortableProducts(products: products,);
            }
          ),
        ),
      ),
    );
  }
}

