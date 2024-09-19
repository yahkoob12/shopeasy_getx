import 'dart:core';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class TFirebaseStorageServices extends GetxController {
  static TFirebaseStorageServices get instance => Get.find();

  final _firebaseStorage = FirebaseStorage.instance;

  ///upload Local Assets from IDE
  ///Returns a Uint8list containing image data
  Future<Uint8List> getImageDataFromAssets(String path) async {
    try {
      final byteData = await rootBundle.load(path);

      ///   var offesetInBytes;
      final imageData = byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes);
      return imageData;
    } catch (e) {
      //Handle Exceptions gracefully
      throw 'Error loading image data : $e';
    }
  }

  ///Upload Imageusing imageData on cloud Firebase Storage
  ///Return the download URL of the Uploaded image
  Future<String> uploadImageData(
      String path, Uint8List image, String name) async {
    try {
      final ref = _firebaseStorage.ref(path).child(name);
      await ref.putData(image);
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      //Handle exception grecefully
      if (e is FirebaseException) {
        throw 'Firebase Exception${e.message}';
      } else if (e is SocketException) {
        throw 'NetWork error ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else {
        throw 'Something Went Wrong! Please try again';
      }
    }
  }

  ///Upload image on Cloud firebase storage
  ///Returns the download URL of the uploaded image
  Future<String> uploadImageFile(String path, XFile image) async {
    try {
      final ref = _firebaseStorage.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      final url = await ref.getDownloadURL();
      return url;
    } catch (e) {
      if (e is FirebaseException) {
        throw 'FireBase EXeption ${e.message}';
      } else if (e is SocketException) {
        throw 'NetWork error ${e.message}';
      } else if (e is PlatformException) {
        throw 'Platform Exception : ${e.message}';
      } else {
        throw 'Something Went Wrong! Please try again';
      }
    }
  }
}
