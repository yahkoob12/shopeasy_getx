import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:shopeasy_getx/common/widget/images/circular_image.dart';
import 'package:shopeasy_getx/common/widget/texts/product_price_text.dart';
import 'package:shopeasy_getx/common/widget/texts/product_title_text.dart';
import 'package:shopeasy_getx/common/widget/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/product_controller.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/enums.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final selePercentage =
        controller.CalculateSalePercentage(product.price, product.salePrice);
    final darkMode = THelperFunctions.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Price & Sale Price
        Row(
          children: [
            /// Sale Tag
            TRoundedContainer(
              radius: TSizes.sm,
              backgroundColor: TColors.secondary.withOpacity(0.8),
              padding: EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '$selePercentage%',
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .apply(color: TColors.black),
              ),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),

            /// Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text(
                '\${product.price}',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .apply(decoration: TextDecoration.lineThrough),
              ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              TProductPriceText(
                price: controller.getProductPrice(product),
                isLarge: true,
              ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Title
        TProductTitleText(title: product.title),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Stock Status
        Row(
          children: [
            TProductTitleText(title: 'Status'),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Brand
        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(
              title: product.brand != null ? product.brand!.name : '',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
