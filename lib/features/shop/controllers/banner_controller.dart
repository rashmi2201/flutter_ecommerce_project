import 'package:flutter_ecommerce_project/data/banners/banner_repository.dart';
import 'package:flutter_ecommerce_project/features/shop/models/banner_model.dart';
import 'package:flutter_ecommerce_project/utlis/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  //varaibles
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;

  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  //update page navigational dots
  void updatepageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

  //fetch banners
  Future<void> fetchBanners() async {
    try {
      //show loader while loading categories
      isLoading.value = true;

      //fetch Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      //assign banners
      this.banners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      //remove oader
      isLoading.value = false;
    }
  }
}
