import 'dart:convert';

import 'package:get/get.dart';
import 'package:shopeasy_getx/data/repositories/product/product_repository.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/utils/local_storage/storage_utility.dart';
import 'package:shopeasy_getx/utils/popups/loaders.dart';

class FavouriteController extends GetxController {
  static FavouriteController get instance => Get.find();

  // Variables
  final favorites = <String, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }

  // Method to initialize favorites by reading from storage
  void initFavorites() {
    final json = TLocalStorage.instance().readData('favorite');
    if (json != null) {
      final storedFavorites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(
          storedFavorites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProducts(String productId) {
    if (!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoriteToStorage();
      TLoaders.customToast(message: 'Product has been added to the Wishlist. ');
    } else {
      TLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoriteToStorage();
      favorites.refresh();
      TLoaders.customToast(message: 'Product has been removed from the list.');
    }
  }

  void saveFavoriteToStorage() {
    final encodedFavorites = json.encode(favorites);
    TLocalStorage.instance().saveData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance
        .getFavouriteProducts(favorites.keys.toList());
  }
}
