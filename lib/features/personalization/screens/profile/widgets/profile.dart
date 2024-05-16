import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/common/widgets/appbar/appbar.dart';
import 'package:flutter_ecommerce_project/common/widgets/images/t_circular_image.dart';
import 'package:flutter_ecommerce_project/common/widgets/sections/section_heading.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/home/widgets/shimmers/shimmer.dart';
import 'package:flutter_ecommerce_project/features/personalization/controllers/user_controller.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/profile/widgets/changename.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: const TAppBar(
        showbackarrow: true,
        titlee: Text('Profile'),
      ),

      //body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(Tsized.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Obx(() {
                      final networkImage = controller.user.value.profilePicture;
                      final image = networkImage.isNotEmpty
                          ? networkImage
                          : TImages.profileImage1;
                      return controller.imageuploading.value
                          ? const TShimmerEffect(
                              width: 80, height: 80, radius: 80)
                          : TCircularImage(
                              width: 80,
                              height: 80,
                              image: image,
                              isNetworkImage: networkImage.isNotEmpty);
                    }),
                    TextButton(
                      onPressed: () => controller.uploadUserProfilePicture(),
                      child: const Text('Change Profile Picture'),
                    ),
                  ],
                ),
              ),
              //details
              const SizedBox(
                height: Tsized.spaceBtwItems / 2,
              ),
              const Divider(),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),

              TProfileMenu(
                  onPressed: () => Get.to(() => const ChangeName()),
                  title: 'Name',
                  value: controller.user.value.fullName),
              TProfileMenu(
                onPressed: () {},
                title: 'User Name',
                value: controller.user.value.username,
              ),
              const Divider(),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              //Heading Personal Info
              const TSectionHeading(
                title: 'Profile Information',
                showActionButton: false,
              ),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              TProfileMenu(
                  onPressed: () {},
                  title: 'User-ID',
                  value: controller.user.value.id),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Email-ID',
                  value: controller.user.value.email),
              TProfileMenu(
                  onPressed: () {},
                  title: 'Contact no.',
                  value: controller.user.value.phoneNumber),
              TProfileMenu(
                onPressed: () {},
                title: 'Gender',
                value: 'Male',
              ),
              TProfileMenu(
                onPressed: () {},
                title: 'DOB',
                value: '01 Sep,1999',
              ),
              const Divider(),
              const SizedBox(
                height: Tsized.spaceBtwItems,
              ),
              Center(
                child: TextButton(
                  onPressed: () => controller.deleteAccountWarningPopup(),
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
