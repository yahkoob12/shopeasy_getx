import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:shopeasy_getx/common/widget/images/circular_image.dart';
import 'package:shopeasy_getx/common/widget/texts/product_price_text.dart';
import 'package:shopeasy_getx/common/widget/texts/product_title_text.dart';
import 'package:shopeasy_getx/common/widget/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/enums.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
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
              padding: const EdgeInsets.symmetric(
                  horizontal: TSizes.sm, vertical: TSizes.xs),
              child: Text(
                '25%',
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
            Text(
              '\$250',
              style: Theme.of(context)
                  .textTheme
                  .titleSmall!
                  .apply(decoration: TextDecoration.lineThrough),
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            TProductPriceText(
              price: '175',
              isLarge: true,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        /// Title
        TProductTitleText(title: 'Green Nike Sporta Shirt'),
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
              'In Stock',
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
              image: TImages.nikeLogo,
              width: 32,
              height: 32,
              overlayColor: darkMode ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerifiedIcon(
              title: 'nike',
              brandTextSizes: TextSizes.medium,
            ),
          ],
        ),
      ],
    );
  }
}
