import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import 'package:shopeasy_getx/features/shop/models/category_model.dart';
import 'package:shopeasy_getx/firebase_storage_services.dart';
import 'package:shopeasy_getx/utils/exceptions/firebase_exceptions.dart';
import 'package:shopeasy_getx/utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  ///variables
  final _db = FirebaseFirestore.instance;

  ///Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection('Categories').get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }

  ///Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection('Categories')
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result =
          snapshot.docs.map((e) => CategoryModel.fromSnapshot(e)).toList();
      return result;
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }

  ///Upload categories to the cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      final storage = Get.put(TFirebaseStorageServices());

      //loop through each category
      for (var category in categories) {
        //Get ImageData  link from the locale assets
        final file = await storage.getImageDataFromAssets(category.image);

        //Upload Image and get its URl
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        //assign URL to Category.image attribute
        category.image = url;

        //store Category in Firestore
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
    } on TFirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }

  ///
}
