import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';

import 'package:shopeasy_getx/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopeasy_getx/features/shop/screens/checkout/checkout.dart';

import 'package:shopeasy_getx/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),

        /// -- Items in Cart
        child: TCartItems(),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(() => CheckoutScreen()),
            child: Text('Checkout \$1532')),
      ),
    );
  }
}
