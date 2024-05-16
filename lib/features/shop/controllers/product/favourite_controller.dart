import 'dart:convert';

import 'package:flutter_ecommerce_project/data/repositories/product/product_repository.dart';
import 'package:flutter_ecommerce_project/features/shop/models/product_model.dart';
import 'package:flutter_ecommerce_project/utlis/local_storage/storage_utility.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';

class FavouritesController extends GetxController {
  static FavouritesController get instance => Get.find();

  //variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavourites();
  }

  //Method to intialize favorites by reading from storage
  void initFavourites() {
    final json = TLocalStorage.instance().readData('favorites');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavourite(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavouriteToStorage();
      TLoaders.customToast(message: 'Product has been added to wishList.');
    } else {
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavouriteToStorage();
      favorites.refresh();
      TLoaders.customToast(
          message: 'Product has been removed from the  wishList.');
    }
  }

  void saveFavouriteToStorage() {
    final encodeFavourites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodeFavourites);
  }

  Future<List<ProductModel>> favouriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favorites.keys.toList());
  }
}