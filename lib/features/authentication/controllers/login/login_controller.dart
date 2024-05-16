
import 'package:flutter/widgets.dart';
import 'package:flutter_ecommerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_project/features/personalization/controllers/user_controller.dart';
import 'package:flutter_ecommerce_project/network/network_manager.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  //varibles
  final remember = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController=Get.put(UserController());

  @override
  void onInit() {
    email.text = localStorage.read('REMEMBER_ME_EMAIL') ?? '';
    password.text = localStorage.read('REMEMBER_ME_PASSWORD') ?? '';
    super.onInit();
  }

  //Email and Password signIn
  Future<void> emailandPasswordSignIn() async {
    try {
      //Start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in....', TImages.profileImage3);

      //check internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();

        return;
      }
      //form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      //save data if remenber is selected
      if (remember.value) {
        localStorage.write('REMEMBER_ME_EMAIL', email.text.trim());
        localStorage.write('REMEMBER_ME_PASSWORD', password.text.trim());
      }

      //login user using Email & password authentication

      // ignore: unused_local_variable
      final UserCredential = await AuthenticationRepository.instance
          .loginWithEmailandPassword(email.text.trim(), password.text.trim());

      //remove loader
      TFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  //--google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      //start loading
      TFullScreenLoader.openLoadingDialog(
          'Logging you in....', TImages.profileImage2);

      //check internet connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      //google authentication
      final userCredentials =await AuthenticationRepository.instance.signInWithGoogle();
      
      //save user records
      await userController.saveUserRecord(userCredentials);

      //remove loader
      TFullScreenLoader.stopLoading();

      //redirect
      AuthenticationRepository.instance.screenRedirect();



    } catch (e) {
      //remove loader
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }
}
