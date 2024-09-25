import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/cart_controller.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/features/shop/screens/product_datails/product_details.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/enums.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class ProductCardAddToCartButton extends StatelessWidget {
  const ProductCardAddToCartButton({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: () {
        // If the product have variations then show the product details for variation selection.
        // else add product to the cart
        if (product.productType == ProductType.single.toString()) {
          final cartItem = cartController.convertToCartItem(product, 1);
          cartController.addOneToCart(cartItem);
        } else {
          Get.to(() => ProductDetails(product: product));
        }
      },
      child: Obx(() {
        final productQuantityInCart =
            cartController.getProductQuantityInCart(product.id);
        return Container(
          decoration: BoxDecoration(
            color: productQuantityInCart > 0 ? TColors.primary : TColors.dark,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(TSizes.cardRadiusMd),
              bottomLeft: Radius.circular(TSizes.productImageRadius),
            ),
          ),
          child: SizedBox(
            width: TSizes.iconLg * 1.2,
            height: TSizes.iconLg * 1.2,
            child: Center(
                child: productQuantityInCart > 0
                    ? Text(
                        productQuantityInCart.toString(),
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .apply(color: TColors.white),
                      )
                    : Icon(
                        Iconsax.add,
                        color: TColors.white,
                      )),
          ),
        );
      }),
    );
  }
}
