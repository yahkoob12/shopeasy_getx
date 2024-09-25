import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/success_screen/success_screen.dart';
import 'package:shopeasy_getx/data/repositories/authentication/authentication_repository.dart';
import 'package:shopeasy_getx/data/repositories/order/order_repository.dart';
import 'package:shopeasy_getx/features/personalization/controllers/address_controller.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/cart_controller.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/checkout_controller.dart';
import 'package:shopeasy_getx/features/shop/models/order_model.dart';
import 'package:shopeasy_getx/navigation_menu.dart';
import 'package:shopeasy_getx/utils/constants/enums.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/popups/full_screen_loader.dart';
import 'package:shopeasy_getx/utils/popups/loaders.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// fetch User's order history
  Future<List<OrderModel>> fetchUserOrder() async {
    try {
      final userOrders = await orderRepository.fetchUserOrder();
      return userOrders;
    } catch (e) {
      TLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for order processing
  void processOrder(double totalAmount) async {
    try {
      // Start Loader
      TFullScreenLoader.openLoadingDialog(
          'Processing your order', TImages.pencilAnimation);

      // Get user Authentication id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) return;

      // add Details
      final order = OrderModel(
          //Generate a uniique id for the order
          id: UniqueKey().toString(),
          userId: userId,
          status: OrderStatus.pending,
          Items: cartController.cartItems.toList(),
          totalAmount: totalAmount,
          orderDate: DateTime.now(),
          paymentMethod: checkoutController.selectedPaymentMethod.value.name,
          address: addressController.selectedAddress.value);

      // Save the order to Firebase
      await orderRepository.saveOrder(order, userId);

      // Update the cart status
      cartController.ClearCart();

      // Show Success screen
      Get.off(() => SuccessScreen(
            image: TImages.orderCompletedAnimation,
            title: 'Payment Success!',
            subTitle: 'Your item will be shipped soon',
            onPressed: () => Get.offAll(() => NavigationMenu()),
          ));
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
