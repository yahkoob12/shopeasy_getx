import 'package:get/get.dart';
import 'package:shopeasy_getx/data/repositories/product/product_repository.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/utils/constants/enums.dart';
import 'package:shopeasy_getx/utils/popups/loaders.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  @override
  void onInit() {
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      // Show loader while Loading Products
      isLoading.value = true;

      // Fetch Products
      final product = await productRepository.getFeaturedProducts();

      // Assign Products
      featuredProducts.assignAll(product);
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try {
      // Fetch Products
      final products = await productRepository.getFeaturedProducts();
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Get the product price or price range for variation
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variation exits , return the simple price or sale price
    if (product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price)
          .toString();
    } else {
      // Calculate the smallest and largest price among variations
      for (var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available , otherwise regular price)
        double priceToConsider =
            variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest price
        if (priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if (priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      //  If smallest and largest price are the same , return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      } else {
        // Otherwise return a price range
        return '$smallestPrice - \$largestPrice';
      }
    }
  }

  /// -- Calculates Discount Percentage
  String? CalculateSalePercentage(double originalPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);
  }

  /// -- Check Product Stock status
  String getProductStockStatus(int stock) {
    return stock > 0 ? 'InStock' : 'Out of Stock';
  }
}
