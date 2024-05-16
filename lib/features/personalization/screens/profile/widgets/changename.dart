import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/profile/widgets/update_name_controller.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/constants/text_strings.dart';
import 'package:flutter_ecommerce_project/utlis/validators/validation.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      //custom Appbar
      appBar: TAppBar(
        showbackarrow: true,
        titlee: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(Tsized.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification.This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: Tsized.spaceBtwSections,
            ),

            //text field and button
            Form(
                key: controller.updateUserNameFormKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.firstName,
                      validator: (value) =>
                          TValidator.validateEmptytext('First Name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.firstName,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwInputFields,
                    ),
                    TextFormField(
                      controller: controller.lastNome,
                      validator: (value) =>
                          TValidator.validateEmptytext('Last name', value),
                      expands: false,
                      decoration: const InputDecoration(
                          labelText: TTexts.lastNome,
                          prefixIcon: Icon(Iconsax.user)),
                    ),
                    const SizedBox(
                      height: Tsized.spaceBtwInputFields,
                    ),
                    //save button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () => controller.updateUserName(),
                          child: const Text('Save')),
                    ),
                  ],
                ),
                ),
          ],
        ),
      ),
    );
  }
}
