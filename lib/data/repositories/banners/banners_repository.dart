import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/features/shop/models/banner_model.dart';
import 'package:shopeasy_getx/utils/exceptions/firebase_exceptions.dart';
import 'package:shopeasy_getx/utils/exceptions/format_exceptions.dart';
import 'package:shopeasy_getx/utils/exceptions/platform_exceptions.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();
//variables
  final _db = FirebaseFirestore.instance;
//Get all order related to  current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong . Please try again';
    }
  }
}
