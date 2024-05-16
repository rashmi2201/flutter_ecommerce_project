import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/features/authentication/controllers/onboarding/signup/signup_controller.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/signup.widgets/terms_conditions_checkbox.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/text_strings.dart';
import 'package:flutter_ecommerce_project/utlis/helpers/helper_functions.dart';
import 'package:flutter_ecommerce_project/utlis/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class TSignupForm extends StatelessWidget {
  const TSignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final dark = THelperfunctions.isDarkMode(context);
    final controller = Get.put(SignupController());

    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstName,
                  validator: (value) =>
                      TValidator.validateEmptytext('First name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.firstName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
              const SizedBox(
                width: Tsized.spaceBtwInputFields,
              ),
              Expanded(
                child: TextFormField(
                  controller: controller.lastNome,
                  validator: (value) =>
                      TValidator.validateEmptytext('Last name', value),
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: TTexts.lastNome,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              )
            ],
          ),
          const SizedBox(
            height: Tsized.spaceBtwInputFields,
          ),
          //username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                TValidator.validateEmptytext('username', value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: Tsized.spaceBtwInputFields,
          ),
          //email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: Tsized.spaceBtwInputFields,
          ),
          //phone number
          TextFormField(
            validator: (value) => TValidator.validatePhoneNumber(value),
            controller: controller.phoneNumber,
            expands: false,
            decoration: const InputDecoration(
                labelText: TTexts.phoneNo, prefixIcon: Icon(Iconsax.call)),
          ),
          const SizedBox(
            height: Tsized.spaceBtwInputFields,
          ),

          //password
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
          const SizedBox(
            height: Tsized.spaceBtwInputFields,
          ),

          const TTermsAndConditonCheckbox(),
          const SizedBox(
            height: Tsized.spaceBtwSections,
          ),
          //sign up button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () => controller.signup(),
                child: const Text(TTexts.createAccount)),
          ),
        ],
      ),
    );
  }
}
