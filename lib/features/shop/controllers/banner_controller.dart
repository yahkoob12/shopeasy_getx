import 'package:get/get.dart';
import 'package:shopeasy_getx/data/repositories/banners/banners_repository.dart';
import 'package:shopeasy_getx/features/shop/models/banner_model.dart';
import 'package:shopeasy_getx/utils/popups/loaders.dart';

class BannerController extends GetxController {
  // veriables
  final isLoading = false.obs;
  final carousalCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  @override
  void onInit() {
    fetchBanner();
    super.onInit();
  }

//Update page navigational Dots
  void updatePageIndicator(index) {
    carousalCurrentIndex.value = index;
  }

//fetch banner
  Future<void> fetchBanner() async {
    try {
      ///Show loader while loading categories
      isLoading.value = true;

      ///Fetch  Banners
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.fetchBanners();

      ///assign  Banners
      this.banners.assignAll(banners);

      ///Filter featured categories
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    } finally {
      //remove Loader
      isLoading.value = false;
    }
  }

//
//
//
//
//
}
