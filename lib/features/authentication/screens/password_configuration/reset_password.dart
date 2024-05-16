import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/authentication/controllers/forget_password/forget_password_controller.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/login/login.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/text_strings.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image(
              image: const AssetImage(TImages.deliveredEmailIllustration),
              width: THelperfunctions.screenWeight() * 0.6,
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            //email,title&subtitle
            Text(
              TTexts.email,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),

            Text(
              TTexts.changeYourPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            Text(
              TTexts.changeYourPasswordSubtitle,
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(TTexts.done)),
            ),
            const SizedBox(
              height: Tsized.spaceBtwItems,
            ),
            SizedBox(
              width: double.infinity,
              child: TextButton(
                  onPressed: () => ForgetPasswordController.instance
                      .resendPasswordResetEmail(email),
                  child: const Text(TTexts.resendEmail)),
            ),
          ],
        ),
      ),
    );
  }
}
