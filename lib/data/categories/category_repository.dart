import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_project/data/services/firebase_storage_service.dart';
import 'package:flutter_ecommerce_project/features/shop/controllers/category_controller.dart';
import 'package:flutter_ecommerce_project/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_project/utlis/exceptions/firebase_exceptions.dart';
import 'package:flutter_ecommerce_project/utlis/exceptions/platform_exception.dart';

import 'package:get/get.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  //variables
  final _db = FirebaseFirestore.instance;

//--------------categories-------------//
  //Get all categories
  Future<List<CategoryModel>> getAllcategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Something went wrong.please try again';
    }
  }

  //get sub categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw TPlatformExceptions(e.code).message;
    } catch (e) {
      throw 'Somethimg went wrong .please try again';
    }
  }

//upload categories to the cloud firestore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      //upload all the categories along with thier images
      final storage = Get.put(TFirebaseStorageService());

      //loop through each category
      for (var category in categories) {
        //Get imagedata link from the local assets

        final file = await storage.getImageDataFromAssets(category.image);

        //upload image and get its URL
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        //assign url to Category.image attribute
        category.image = url;

        //store category in firestore
        await _db
            .collection('Categories')
            .doc(category.id)
            .set(category.toJson());
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
