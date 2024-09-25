import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/cart_controller.dart';

import 'package:shopeasy_getx/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopeasy_getx/features/shop/screens/checkout/checkout.dart';
import 'package:shopeasy_getx/navigation_menu.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';

import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/popups/animation_loader.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        // Nothing Found Widget
        final emptyWidget = TAnimationLoaderWidget(
          text: 'Whoops! Cart is Empty .',
          animation: TImages.carAnimation,
          showAction: true,
          actionText: 'Let\'s  fill it,',
          onActionPressed: () => Get.off(() => NavigationMenu()),
        );
        if (controller.cartItems.isEmpty) {
          return emptyWidget;
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),

              /// -- Items in Cart
              child: TCartItems(),
            ),
          );
        }
      }),

      /// Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty
          ? SizedBox()
          : Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: () => Get.to(() => CheckoutScreen()),
                  child: Obx(() =>
                      Text('Checkout \$${controller.totalCartPrice.value}'))),
            ),
    );
  }
}
