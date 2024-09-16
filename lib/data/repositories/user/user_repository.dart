import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shopeasy_getx/data/repositories/authentication/authentication_repository.dart';
import 'package:shopeasy_getx/features/authentication/models/user_models.dart';
import 'package:shopeasy_getx/utils/exceptions/firebase_exceptions.dart';
import 'package:shopeasy_getx/utils/exceptions/format_exceptions.dart';
import 'package:shopeasy_getx/utils/exceptions/platform_exceptions.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  ///function to save user date to firebase
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection("Users").doc(user.id).set(user.toJson());
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

//   ///Function to update user data in Firebase.
//   Future<void> updateUserDetails(UserModel updatedUser) async {
//     try {
//       await _db
//           .collection("Users")
//           .doc(updatedUser.id)
//           .update(updatedUser.toJson());
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong . Please try again';
//     }
//   }

//   //Function_to_fetch_user_datails based_on user ID
//   Future<UserModel> fetchUserDetails() async {
//     try {
//       final DocumentSnapshot = await _db
//           .collection("Users")
//           .doc(AuthenticationRepository.instance.authUser?.uid)
//           .get();
//       if (DocumentSnapshot.exists) {
//         return UserModel.fromSnapshot(DocumentSnapshot);
//       } else {
//         return UserModel.empty();
//       }
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong . Please try again';
//     }
//   }

// //Update any field in specific users collection
//   Future<void> updateSingleField(Map<String, dynamic> json) async {
//     try {
//       await _db
//           .collection("Users")
//           .doc(AuthenticationRepository.instance.authUser?.uid)
//           .update(json);
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong . Please try again';
//     }
//   }

// //Fuction to remove user data from Firestore
//   Future<void> removeUserRecord(String userId) async {
//     try {
//       await _db.collection("Users").doc(userId).delete();
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong . Please try again';
//     }
//   }

// //Upload any image
//   Future<String> uploadImage(String path, XFile image) async {
//     try {
//       final ref = FirebaseStorage.instance.ref(path).child(image.name);
//       await ref.putFile(File(image.path));
//       final url = await ref.getDownloadURL();
//       return url;
//     } on FirebaseException catch (e) {
//       throw TFirebaseException(e.code).message;
//     } on FormatException catch (_) {
//       throw const TFormatException();
//     } on PlatformException catch (e) {
//       throw TPlatformException(e.code).message;
//     } catch (e) {
//       throw 'Something went wrong . Please try again';
//     }
//   }
//
//
//
//
//
//
//
//
}
