import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
// ignore: unused_import
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_container.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/address/widgets/add_new_address.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/address/widgets/single_address.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/address_controller.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/cloud_helper_functions.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(() => const AddNewAddressScreen()), 
        child: const Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        showbackarrow: true,
        titlee: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsized.defaultSpace),
          child: Obx(
            ()=> FutureBuilder(
              //use key to trigger refresh
              key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddress(),
                builder: (context, snapshot) {
                  //helper function,handle loader,no record,or error message
                  final response = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (response != null) return response;
            
                  final adresses = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: adresses.length,
                      itemBuilder: (_, index) =>
                          TSingleAddress(address:adresses[index], onTap: ()=>controller.selectAddress(adresses[index]),));
                }),
          ),
        ),
      ),
    );
  }
}
