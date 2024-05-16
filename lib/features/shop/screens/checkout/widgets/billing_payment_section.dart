import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_rounded_container.dart';
import 'package:flutter_ecommerce_project/common/widgets/texts/section_heading.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/product/checkout_controller.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:get/get.dart';


class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(CheckoutController());



    final dark = THelperfunctions.isDarkMode(context);
    return Column(
      children: [
        TSectionHeading(
          title: 'Payment Method',
          ButtonTitle: 'Change',
          onPressed: () =>controller.selectPaymentMethod(context),
        ),
        const SizedBox(
          height: Tsized.spaceBtwItems / 2,
        ),
        Obx(
          ()=> Row(
            children: [
              TRoundedContainer(
                width: 100,
                height: 70,
                backgroundColor: dark ? TColors.light : TColors.white,
                padding:  EdgeInsets.all(Tsized.sm),
                child:  Image(
                  image: AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                width: Tsized.spaceBtwItems / 2,
              ),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        )
      ],
    );
  }
}
