import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/icons/t_circular_icon.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/cart_controller.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TBottomAddToCart extends StatelessWidget {
  const TBottomAddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: TSizes.defaultSpace, vertical: TSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: dark ? TColors.darkerGrey : TColors.light,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(TSizes.cardRadiusLg),
          topRight: Radius.circular(TSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                TCircularIcon(
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                  icon: Iconsax.minus,
                  backgroundColor: TColors.darkGrey,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                ),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                TCircularIcon(
                  onPressed: () => controller.productQuantityInCart.value += 1,
                  icon: Iconsax.add,
                  backgroundColor: TColors.black,
                  width: 40,
                  height: 40,
                  color: TColors.white,
                )
              ],
            ),
            ElevatedButton(
              onPressed: controller.productQuantityInCart.value < 1
                  ? null
                  : () => controller.addToCart(product),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: TColors.black,
                side: BorderSide(color: TColors.black),
              ),
              child: Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
