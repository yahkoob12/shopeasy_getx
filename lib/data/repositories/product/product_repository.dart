import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/firebase_storage_services.dart';
import 'package:shopeasy_getx/utils/constants/enums.dart';
import 'package:shopeasy_getx/utils/exceptions/firebase_exceptions.dart';
import 'package:shopeasy_getx/utils/exceptions/platform_exceptions.dart';

/// Repository for the managing product related data and operations
class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// FireBase Instance for database interaction
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }

  /// Get limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }

  /// Get product based on the brand
  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }

  ///
  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      return snapshot.docs
          .map((QuerySnapshot) => ProductModel.fromSnapshot(QuerySnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }

  ///
  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();

      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }

  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      /// Query to get all documents where productId matches the categoryId & Fetch limited or unlimited based on limit

      QuerySnapshot productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductsCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductsCategory')
              .where('CategoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      // Extract productIds from the documents
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['product'] as String)
          .toList();

      // Query to all documents where the brandId is in the list of brandIds , FieldPath.documents to query document in collection
      final productQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Extract brand names or other relevant data from the documents
      List<ProductModel> products = productQuery.docs
          .map((doc) => ProductModel.fromSnapshot(doc))
          .toList();
      return products;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on TPlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }

  /// Upload dummy data to the cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {
      //Upload all the products along  with their images
      final storage = Get.put(TFirebaseStorageServices());

      //loop through each product
      for (var product in products) {
        //Get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its url
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        //Assign URL to product.thumbnail attributes
        product.thumbnail = url;

        //Product list of image
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            //Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            //Upload image and get its Url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // Assign URl to product.thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }
        //Upload Variable Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            //Get image data link from local assets
            final assetImage =
                await storage.getImageDataFromAssets(variation.image);

            //Upload image and get its Url
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, variation.image);
            //Assign Url to Variation .image attribute
            variation.image = url;
          }
        }
        // store product in FireStore
        await _db.collection('Products').doc(product.id).set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw e.message!;
    } on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    }
  }
}
