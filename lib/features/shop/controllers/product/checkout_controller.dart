import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/sections/section_heading.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/payment_tile.dart';
import 'package:flutter_ecommerce_project/features/shop/models/payment_method_model.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(image: TImages.applepay, name: 'Paypal');
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(Tsized.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TSectionHeading(
                      title: 'Select Payment Method',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),
                    TPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.applepay, name: 'Paypal'),
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),
                      TPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.googlepay, name: 'Googlepay'),
                    ),
                     const SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),
                      TPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.paytm, name: 'Paytm'),
                    ),
                     const SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),
                     TPaymentTile(
                      paymentMethod: PaymentMethodModel(
                          image: TImages.visa, name: 'Visa'),
                    ),
                     const SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),
                    
                  ],
                ),
              ),
            ));
  }
}
