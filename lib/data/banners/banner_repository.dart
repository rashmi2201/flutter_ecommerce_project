import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_project/data/services/firebase_storage_service.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/banner_model.dart';
import 'package:flutter_ecommerce_project/utlis/exceptions/firebase_exceptions.dart';
import 'package:flutter_ecommerce_project/utlis/exceptions/format_exceptions.dart';
import 'package:flutter_ecommerce_project/utlis/exceptions/platform_exception.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

  //get all order realted to current user
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: false)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong while fetching Banners.';
    }
  }

  //uplaod banners to the cloud firebase
  Future<void> uploadBannerData(List<BannerModel> banners) async {
    try {
      //upload all the categories along with thier images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each category
      for (var banner in banners) {
        //Get imagedata link from the local assets

        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        //upload image and get its URL
        final url =
            await storage.uploadImageData('Banners', file, banner.targetScreen);

        //assign url to Category.image attribute
        banner.imageUrl = url;

        //store category in firestore
        await _db
            .collection('Banners')
            .doc(banner.targetScreen)
            .set(banner.toJson());
      }
      Get.put(CategoryController());
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somethimg went wrong .please try again';
    }
  }
}
