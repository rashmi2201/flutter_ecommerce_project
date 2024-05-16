import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/form_divider.dart';
import 'package:flutter_ecommerce_project/features/authentication/controllers/login/login_controller.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/login/widgets/login_header.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/signup.widgets/signup.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/password_configuration/forget_password.dart';
import 'package:flutter_ecommerce_project/utlis/constants/colors.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/text_strings.dart';
import 'package:flutter_ecommerce_project/utlis/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TLoginForm extends StatelessWidget {
  const TLoginForm({
    super.key,
    required this.dark,
  });

  final bool dark;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Column(
      children: [
        TLoginHeader(dark: dark),
        Form(
          key: controller.loginFormKey,
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: Tsized.spaceBtwSections),
            child: Column(
              children: [
                //email
                TextFormField(
                  controller: controller.email,
                  validator: (value) => TValidator.validateEmail(value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: TTexts.email,
                  ),
                ),
                const SizedBox(height: Tsized.spaceBtwInputFields),
                // Password
                Obx(
                  () => TextFormField(
                    controller: controller.password,
                    obscureText: controller.hidePassword.value,
                    validator: (value) => TValidator.validatePassword(value),
                    expands: false,
                    decoration: InputDecoration(
                      labelText: TTexts.password,
                      prefixIcon: const Icon(Iconsax.password_check),
                      suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye)),
                    ),
                  ),
                ),
                const SizedBox(height: Tsized.spaceBtwInputFields / 2),

                /// Remember me
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Obx(
                          () => Checkbox(
                              value: controller.remember.value,
                              onChanged: (value) => controller.remember.value =
                                  !controller.remember.value),
                        ),
                        const Text(TTexts.rememberMe),
                      ],
                    ),

                    /// Forget password
                    TextButton(
                      onPressed: () => Get.off(() => const ForgetPassword()),
                      child: const Text(TTexts.forgetPassword),
                    ),
                  ],
                ),
                const SizedBox(height: Tsized.spaceBtwSections),

                /// Buttons
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.emailandPasswordSignIn(),
                    child: const Text(TTexts.signIn),
                  ),
                ),
                const SizedBox(height: Tsized.spaceBtwItems),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Get.to(() => const SignupScreen()),
                    child: const Text(TTexts.createAccount),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// Divider
        const Divider(),
        const TFormDivider(
          dividerText: '',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: TColors.grey),
                borderRadius: BorderRadius.circular(100),
              ),
              child: IconButton(
                onPressed: () {
                  controller.googleSignIn();
                },
                icon: const Image(
                  image: AssetImage(TImages.google),
                  width: Tsized.iconMd,
                  height: Tsized.iconMd,
                ),
              ),
            ),
            const SizedBox(
              width: Tsized.spaceBtwItems,
            ),
            Container(
                decoration: BoxDecoration(
                  border: Border.all(color: TColors.grey),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset(
                    "assets/logos/facebook.png",
                    width: Tsized.iconMd,
                    height: Tsized.iconMd,
                  ),
                )),
          ],
        )
      ],
    );
  }
}
