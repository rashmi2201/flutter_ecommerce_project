import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/text_strings.dart';
import 'package:flutter_ecommerce_project/utlis/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ForgetPasswordController());

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              TTexts.forgotPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            Text(
              TTexts.forgotPasswordSubtitle,
              style: Theme.of(context).textTheme.labelMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Tsized.spaceBtwSections * 2,
            ),
            Form(
              key: controller.forgetPasswordFormKey,

              child: TextFormField(
                controller: controller.email,
                validator: TValidator.validateEmail,

                decoration: const InputDecoration(
                  labelText: TTexts.email,
                  prefixIcon: Icon(Iconsax.direct_right),
                ),
              ),
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () =>controller.sendPasswordResetEmail(),
                    child: const Text(TTexts.submit))),
          ],
        ),
      ),
    );
  }
}
