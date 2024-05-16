import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_project/data/repositories/authentication/authentication_repository.dart';
import 'package:flutter_ecommerce_project/data/repositories/user/user_model.dart';
import 'package:flutter_ecommerce_project/data/repositories/user/user_repository.dart';
import 'package:flutter_ecommerce_project/features/authentication/screens/onboarding/login/login.dart';
import 'package:flutter_ecommerce_project/features/personalization/screens/profile/widgets/re_authentication_user_login_form.dart';
import 'package:flutter_ecommerce_project/network/network_manager.dart';
import 'package:flutter_ecommerce_project/utlis/constants/image_strings.dart';
import 'package:flutter_ecommerce_project/utlis/constants/sizes.dart';

import 'package:flutter_ecommerce_project/utlis/popups/full_screen_loader.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  final hidepassword = false.obs;
  final imageuploading = false.obs;
  final verifypassword = TextEditingController();
  final verifyemail = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();

    fetchUserRecord();
  }

  //fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
      profileLoading.value = false;
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  // save user record  from any  Registration provider

  Future<void> saveUserRecord(UserCredential? userCredential) async {
    try {
      //refresh user record.... First update Rx user and then check if user user data is already stored. if not store new data
      await fetchUserRecord();

      //if no record already stored...

      if (user.value.id.isEmpty) {
        if (userCredential != null) {
          // convert name to first and last name
          final nameParts =
              UserModel.nameParts(userCredential.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredential.user!.displayName ?? '');

          // map data
          final User = UserModel(
            id: userCredential.user!.uid,
            firstName: nameParts[0],
            lastNome:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredential.user!.email ?? '',
            phoneNumber: userCredential.user!.phoneNumber ?? '',
            profilePicture: userCredential.user!.photoURL ?? '',
          );
          //save user data
          await userRepository.saveUserRecord(User);
        }
      }
    } catch (e) {
      TLoaders.warningSnackBar(
        title: 'Data Not Saved',
        message:'Something went wrong while saving your information. you can resave your data in your profile',
      );
    }
  }

// delete account warning poppup
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(Tsized.md),
        title: 'Delete Account',
        middleText:
            'Are You sure want to delete your account permanently? This action is not reversible and all of your data will be removed permanently.',
        confirm: ElevatedButton(
          onPressed: () {
            deleteUserAccount();
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              side: const BorderSide(color: Colors.red)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: Tsized.lg),
            child: Text('Delete'),
          ),
        ),
        cancel: OutlinedButton(
            onPressed: () => Navigator.of(Get.overlayContext!).pop(),
            child: const Text("cancel")));
  }

  //Delete user Account

  void deleteUserAccount() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.profileImage1);

      //First re-Authenticate User
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        //Re Verify Auth Email
        if (provider == 'google.com') {
          await auth.signInWithGoogle();
          await auth.deleteAccount();
          TFullScreenLoader.stopLoading();
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          TFullScreenLoader.stopLoading();
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'OH snap', message: e.toString());
    }
  }

  //- - RE-Authenticate before deleting

  Future<void> reAuthenticateEmailAndpasswordUser() async {
    try {
      TFullScreenLoader.openLoadingDialog('Processing', TImages.profileImage3);

      //check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      if (!reAuthFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyemail.text.trim(), verifypassword.text.trim());
      await AuthenticationRepository.instance.deleteAccount();
      TFullScreenLoader.stopLoading();
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.warningSnackBar(title: 'Oh Snap', message: e.toString());
    }
  }

  //  reAuthenticateEmailAndpasswordUser() {}

  // upload profile image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(
          source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageuploading.value = true;
        //upload image
        final imageUrl =
            await userRepository.uploadImage('users/Images/profile/', image);

        //update user image record
        Map<String, dynamic> json = {'ProfilePicture': imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();
        TLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your profile picture is uploaded',
        );
      }
    } catch (e) {
      TLoaders.errorSnackBar(
          title: 'Oh Dear',message: 'Something went wrong : $e');
    } finally {
      imageuploading.value = false;
    }
  }
}
