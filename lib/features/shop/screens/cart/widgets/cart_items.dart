import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/products/cart/add_remove_button.dart';
import 'package:shopeasy_getx/common/widget/products/cart/cart_item.dart';
import 'package:shopeasy_getx/common/widget/texts/product_price_text.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TCartItems extends StatelessWidget {
  const TCartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });
  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => Column(
              children: [
                /// Cart item
                TCartItem(),
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
                          TProductQuantityWithAddRemoveButton(),
                        ],
                      ),

                      /// -- Product total price
                      TProductPriceText(price: '345')
                    ],
                  ),
              ],
            ),
        separatorBuilder: (_, __) => SizedBox(
              height: TSizes.spaceBtwSections,
            ),
        itemCount: 2);
  }
}
