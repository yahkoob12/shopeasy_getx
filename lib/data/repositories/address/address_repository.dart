import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/data/repositories/authentication/authentication_repository.dart';
import 'package:shopeasy_getx/features/personalization/models/address_model.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();
  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddress() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty)
        throw ' Unable to find user information . try again in few minutes';

      final result =
          await _db.collection('Users').doc(userId).collection('Address').get();

      return result.docs
          .map((documentSnapshot) =>
              AddressModel.fromDocumentSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Somthing went wrong while fecthing Address Information . Try again later';
    }
  }

// Clear the 'selected' field for all address
  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db
          .collection('User')
          .doc(userId)
          .collection('address')
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      throw 'Unable to update your address selection . Try again later.';
    }
  }

  // Store new user order
  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final currentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection('Address')
          .add(address.toJson());
      return currentAddress.id;
    } catch (e) {
      throw 'Something went wrong while saving Address Information . Try again later';
    }
  }
}
