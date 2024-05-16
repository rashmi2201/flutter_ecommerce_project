import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_project/data/repositories/user/user_model.dart';
import 'package:flutter_ecommerce_project/data/repositories/user/user_repository.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/signup.widgets/verify_email.dart';
import 'package:flutter_ecommerce_project/network/network_manager.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  //variables
  final hidePassword = true.obs; //hiding/showing/password
  final privacyPolicy = true.obs; //observable for privacy policy acceptance
  final email = TextEditingController(); //controller for email input
  final lastNome = TextEditingController(); //controller for last name input
  final username = TextEditingController(); //controller for user name input
  final password = TextEditingController(); //controller for password input
  final firstName = TextEditingController(); //controller for first name input
  final phoneNumber =
      TextEditingController(); //controller for phone number input
  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); //form key for form validation

  //--SIGNUP
  void signup() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information....', TImages.profileImage2);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        //remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //form validation
      if (!signupFormKey.currentState!.validate()) {
        //remove loader
        TFullScreenLoader.stopLoading();
        return;
      }

      //privacy policy check
      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
          title: 'Accept privacy policy',
          message:
              'In order to create account you must have to read and except the privacy policy & terms of Use',
        );
        return;
      }

      //register user in the firebase authentication and save user data in the firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              email.text.trim(), password.text.trim());

      //save authenticated user data in the firebase firestore
      // ignore: unused_local_variable
      final newUser = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName.text.trim(),
          lastNome: lastNome.text.trim(),
          username: username.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      //remove loader
      TFullScreenLoader.stopLoading();

      //show success message
      TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue');

      //move to verify email screen
      Get.to(() => VerifyEmailScreen(email: email.text.trim()));

      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      //remove loader
      TFullScreenLoader.stopLoading();
      //show some generic error to the user
      
      TLoaders.errorSnackBar(title: 'OnSnap!', message: e.toString());
    }
  }
}
