import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/products/cart/coupon_widget.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/cart_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/order_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:flutter_ecommerce_project/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/pricing_calculator.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartController=CartController.instance;
    final subTotal=cartController.totalCartPrice.value;
    final orderController=Get.put(OrderController());
    final totalAmount=TPricingCalculator.calculateTotalPrice(subTotal,'US');


    // ignore: unused_local_variable
    final dark = THelperfunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showbackarrow: true,
        titlee: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),

          // items in cart
          child: Column(
            children: [
              // items in cart
              const TCartItems(
                showaddremoveButtons: false,
              ),
              const SizedBox(
                height: Tsized.spaceBtwSections,
              ),

              // coupon textfeild
              const TCouponCode(),

              const SizedBox(
                height: Tsized.spaceBtwSections,
              ),

              //biling section
              TRoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(Tsized.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: const Column(
                  children: [
                    //pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),

                    //divider
                    Divider(),
                    SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),

                    //payment  method
                    TBillingPaymentSection(),
                    SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),
                    //address
                    TBillingAddressSection(),
                    SizedBox(
                      height: Tsized.spaceBtwSections,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      //checkout button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: ElevatedButton(
            onPressed: subTotal>0?
            ()=> orderController.processOrder(totalAmount)
            :()=> TLoaders.warningSnackBar(title: 'Empty Cart',message: 'Add items in the cart in order to proceed.'),
            child:  Text('Checkout\$$totalAmount')),
      ),
    );
  }
}