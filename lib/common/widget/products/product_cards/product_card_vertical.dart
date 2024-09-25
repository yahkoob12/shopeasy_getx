import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/styles/shadows.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:shopeasy_getx/common/widget/images/rounded_image.dart';
import 'package:shopeasy_getx/common/widget/products/fevourite_icon/fevourite_icon.dart';
import 'package:shopeasy_getx/common/widget/texts/product_price_text.dart';
import 'package:shopeasy_getx/common/widget/texts/product_title_text.dart';
import 'package:shopeasy_getx/common/widget/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/product_controller.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/features/shop/screens/product_datails/product_details.dart';
import 'package:shopeasy_getx/features/shop/screens/product_datails/widgets/add_to_cart_button.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/enums.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final salePercentage =
        controller.CalculateSalePercentage(product.price, product.salePrice);
    final dark = THelperFunctions.isDarkMode(context);

    /// Container with side padding , color , edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetails(
            product: product,
          )),
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkGrey : TColors.white),
        child: Column(
          children: [
            /// Thumbnail
            TRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(TSizes.sm),
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  /// Thumbnail Image
                  TRoundedImage(
                    imageUrl: product.thumbnail,
                    applyImageRadius: true,
                    isNetworkImage: true,
                  ),

                  /// Sale Tag
                  if (salePercentage != null)
                    Positioned(
                      top: 12,
                      child: TRoundedContainer(
                        radius: TSizes.sm,
                        backgroundColor: TColors.secondary.withOpacity(0.8),
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.sm, vertical: TSizes.xs),
                        child: Text(
                          '$salePercentage%',
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .apply(color: TColors.black),
                        ),
                      ),
                    ),

                  ///  Favourite Icon Button
                  Positioned(
                    top: 0,
                    right: 0,
                    child: TFevouriteIcon(
                      productId: product.id,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),

            /// Details
            Padding(
              padding: EdgeInsets.symmetric(horizontal: TSizes.sm),
              // Only reason to use the SizedBox here is to make Column full width
              child: SizedBox(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TProductTitleText(title: product.title, smallSize: true),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TBrandTitleWithVerifiedIcon(
                      title: product.brand!.name,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Price
                Flexible(
                  child: Column(
                    children: [
                      if (product.productType ==
                              ProductType.single.toString() &&
                          product.salePrice > 0)
                        Padding(
                          padding: EdgeInsets.only(left: TSizes.sm),
                          child: Text(
                            product.price.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .apply(decoration: TextDecoration.lineThrough),
                          ),
                        ),

                      /// Price , show sale price as main price if sale exist
                      Padding(
                        padding: EdgeInsets.only(left: TSizes.sm),
                        child: TProductPriceText(
                            price: controller.getProductPrice(product)),
                      ),
                    ],
                  ),
                ),

                /// Add to cart button
                ProductCardAddToCartButton(product: product),
                // Container(
                //   decoration: const BoxDecoration(
                //     color: TColors.dark,
                //     borderRadius: BorderRadius.only(
                //       topLeft: Radius.circular(TSizes.cardRadiusMd),
                //       bottomRight: Radius.circular(TSizes.productImageRadius),
                //     ),
                //   ),
                //   child: const SizedBox(
                //     width: TSizes.iconLg * 1.2,
                //     height: TSizes.iconLg * 1.2,
                //     child: Center(
                //       child: Icon(Iconsax.add, color: TColors.white),
                //     ),
                //   ),
                // ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
