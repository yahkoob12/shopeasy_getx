import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/products/cart/add_remove_button.dart';
import 'package:shopeasy_getx/common/widget/products/cart/cart_item.dart';
import 'package:shopeasy_getx/common/widget/texts/product_price_text.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/cart_controller.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    final cartcontroller = CartController.instance;
    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, index) => Obx(() {
                final item = cartcontroller.cartItems[index];
                return Column(
                  children: [
                    /// Cart item
                    TCartItem(
                      cartItem: item,
                    ),
                    if (showAddRemoveButtons)
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                    /// Add Remove Button Row with total Price
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              /// Extra Space
                              SizedBox(
                                width: 70,
                              ),

                              ///Add remove Button
                              TProductQuantityWithAddRemoveButton(
                                quantity: item.quantity,
                                add: () => cartcontroller.addOneToCart(item),
                                remove: () =>
                                    cartcontroller.removeOneFromCart(item),
                              ),
                            ],
                          ),

                          /// -- Product total price
                          TProductPriceText(
                              price: (item.price * item.quantity)
                                  .toStringAsFixed(1))
                        ],
                      ),
                  ],
                );
              }),
          separatorBuilder: (_, __) => SizedBox(
                height: TSizes.spaceBtwSections,
              ),
          itemCount: cartcontroller.cartItems.length),
    );
  }
}
