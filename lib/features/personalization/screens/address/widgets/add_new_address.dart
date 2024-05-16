import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/address_controller.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:flutter_ecommerce_project/utlis/validators/validation.dart';
import 'package:iconsax/iconsax.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    return Scaffold(
      appBar: const TAppBar(
        titlee: Text('Add new Address'),
        showbackarrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Tsized.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        TValidator.validateEmptytext('Name', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: 'Name')),
                const SizedBox(height: Tsized.spaceBtwInputFields),
                TextFormField(
                    controller: controller.phoneNumber,
                    validator: (value) =>
                        TValidator.validateEmptytext('Phone Number', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user),
                        labelText: 'Phone Number')),
                const SizedBox(height: Tsized.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: controller.street,
                          validator: (value) =>
                              TValidator.validateEmptytext('Street', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building_31),
                              labelText: 'Street')),
                    ),
                    const SizedBox(width: Tsized.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.code),
                              labelText: 'Postal Code')),
                    ),
                  ],
                ),
                const SizedBox(height: Tsized.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          controller: controller.city,
                          validator: (value) =>
                              TValidator.validateEmptytext('City', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.building),
                              labelText: 'City')),
                    ),
                    const SizedBox(width: Tsized.spaceBtwInputFields),
                    Expanded(
                      child: TextFormField(
                          controller: controller.state,
                          validator: (value) =>
                              TValidator.validateEmptytext('State', value),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Iconsax.activity),
                              labelText: 'State')),
                    ),
                  ],
                ),
                const SizedBox(height: Tsized.spaceBtwInputFields),
                TextFormField(
                    controller: controller.country,
                    validator: (value) =>
                        TValidator.validateEmptytext('Country', value),
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global),
                        labelText: 'Country')),
                const SizedBox(height: Tsized.defaultSpace),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () =>controller.addNewAddress(), child: const Text('Save')),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
