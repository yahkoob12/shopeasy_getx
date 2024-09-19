import 'package:get/get.dart';
import 'package:shopeasy_getx/data/repositories/categories/category_repository.dart';
import 'package:shopeasy_getx/features/shop/models/category_model.dart';
import 'package:shopeasy_getx/utils/popups/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  final _categoryRepository = Get.put(CategoryRepository());
  final isLoading = false.obs;
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  ///---Load category data
  Future<void> fetchCategories() async {
    try {
      ///Show loader while loading categories
      isLoading.value = true;

      ///Fetch categories from data source (FireStore , API,etc)
      final categories = await _categoryRepository.getAllCategories();

      ///Update the categories list
      allCategories.assignAll(categories);

      ///Filter featured categories
      featuredCategories.assignAll(allCategories
          .where((category) => category.isFeatured && category.parentId.isEmpty)
          .take(8)
          .toList());
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap !', message: e.toString());
    } finally {
      //remove Loader
      isLoading.value = false;
    }
  }

  ///---Load selected category data

  /// Get category or Sub-Category Products
}
