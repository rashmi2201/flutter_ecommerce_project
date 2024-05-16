import 'package:flutter_ecommerce_project/data/categories/category_repository.dart';
import 'package:flutter_ecommerce_project/data/repositories/product/product_repository.dart';
import 'package:flutter_ecommerce_project/features/shop/models/category_model.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  //load category data
  Future<void> fetchCategories() async {
    try {
      //show loader while loading categories
      isLoading.value = true;
      //fetch categories from data source (Firestore,API,etc)
      final categories = await _categoryRepository.getAllcategories();

      //update the categories list
      allCategories.assignAll(categories);

      //Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured )
         
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //remove oader
      isLoading.value = false;
    }
  }

  //load selected category data

  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final subCategories =
          await _categoryRepository.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  //get category or sub category products
  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, }) async {
    try {
      //Fetch limited(4) products against each subCategory;
      final products = await ProductRepository.instance
          .getProductsForCategory(categoryId: categoryId, );
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }
}
