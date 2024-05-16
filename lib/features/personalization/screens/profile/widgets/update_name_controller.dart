import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/data/repositories/user/user_repository.dart';
import 'package:flutter_ecommerce_project/features/personalization/controllers/user_controller.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/profile/widgets/profile.dart';
import 'package:flutter_ecommerce_project/network/network_manager.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastNome = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  //init user data when home screen appears
  @override
  void onInit() {
    initializeNames();
    super.onInit();
  }

  //fetch user record
  Future<void> initializeNames() async {
    firstName.text = userController.user.value.firstName;
    lastNome.text = userController.user.value.lastNome;
  }

  Future<void> updateUserName() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog
      (
          'We are updating your information.....', TImages.profileImage2
         
       );

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
     
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!updateUserNameFormKey.currentState!.validate()) {
       
        TFullScreenLoader.stopLoading();
        return;
      }
      //update usrs first and last name in the firebase firestore
      Map<String, dynamic> name = {
        

        'FirstName': firstName.text.trim(),
        'LastName': lastNome.text.trim()
      };
      await userRepository.updateSingleField(name);

      //update the Rx user value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastNome = lastNome.text.trim();
 
      //remove loader
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations', message: 'Your Name has been updated');

      //move to previos screen
      Get.off(() => const ProfileScreen());
    } 
    catch (e) {
   
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
