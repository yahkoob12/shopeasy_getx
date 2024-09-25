import 'package:get/get.dart';
import 'package:shopeasy_getx/data/repositories/brand/brand_repository.dart';
import 'package:shopeasy_getx/data/repositories/product/product_repository.dart';
import 'package:shopeasy_getx/features/shop/models/brand_model.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/utils/popups/loaders.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  RxBool isLoading = true.obs;
  final RxList<BrandModel> allBrands = <BrandModel>[].obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// -- Load Brands

  Future<void> getFeaturedBrands() async {
    try {
      // Show loader while loading Brands
      isLoading.value = false;

      final brands = await brandRepository.getAllBrands();

      allBrands.assignAll(brands);

      featuredBrands.assignAll(
          brands.where((brand) => brand.isFeatured ?? false).take(4));
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // stop Loader
      isLoading.value = false;
    }
  }

  /// -- Get Brands For Categories
  Future<List<ProductModel>> getBrandsForCategory(String brandId) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap !", message: e.toString());
      return [];
    }
  }

  /// -- Get Brand Specific  products from your data source
  Future<List<ProductModel>> getBrandProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap !", message: e.toString());
      return [];
    }
  }
}
