import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/data/repositories/authentication/authentication_repository.dart';
import 'package:shopeasy_getx/features/shop/models/order_model.dart';

class OrderRepository extends GetxController {
  static OrderRepository get instance => Get.find();

  // Variables
  final _db = FirebaseFirestore.instance;

  /*--------------------------- Functions ----------------------------*/

  /// Get all order related to current Usre
  Future<List<OrderModel>> fetchUserOrder() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty)
        throw 'Unable to find user information , try again in few minutes ';

      final result =
          await _db.collection('Users').doc(userId).collection('Orders').get();

      return result.docs
          .map((documentSnapshot) => OrderModel.fromSnapshot(documentSnapshot))
          .toList();
    } catch (e) {
      throw 'Something went wrong while fetching user information , Try again later';
    }
  }

  /// Store new user order
  Future<void> saveOrder(OrderModel order, String userId) async {
    try {
      await _db
          .collection('Users')
          .doc(userId)
          .collection('Orders')
          .add(order.toJson());
    } catch (e) {
      throw 'Something went wrong while saving user information , Try again later';
    }
  }
}
