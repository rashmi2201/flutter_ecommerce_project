import 'package:flutter_ecommerce_project/features/shop/controllers/address_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/variation_controller.dart';
import 'package:flutter_ecommerce_project/network/network_manager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(NetworkManager());
      Get.put(VariationController());
      Get.put(AddressController());
      Get.put(CheckoutController());
  }
}
