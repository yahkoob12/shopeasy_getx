import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/images/rounded_image.dart';
import 'package:shopeasy_getx/common/widget/texts/product_title_text.dart';
import 'package:shopeasy_getx/common/widget/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        TRoundedImage(
          imageUrl: TImages.productImage10,
          width: 60,
          height: 60,
          padding: EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),

        /// Title , Price ,Size
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TBrandTitleWithVerifiedIcon(title: 'Nike'),
              Flexible(
                  child: TProductTitleText(
                title: 'Black Sports Shoes',
                maxLines: 1,
              )),

              ///Attributes
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                        text: 'Color',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Green',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'Size',
                        style: Theme.of(context).textTheme.bodySmall),
                    TextSpan(
                        text: 'UK 08',
                        style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}