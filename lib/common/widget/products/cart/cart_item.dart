import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/images/rounded_image.dart';
import 'package:shopeasy_getx/common/widget/texts/product_title_text.dart';
import 'package:shopeasy_getx/common/widget/texts/t_brand_title_text_with_verified_icon.dart';
import 'package:shopeasy_getx/features/shop/models/cart_item_model.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });
  final CartItemModel cartItem;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ///Image
        TRoundedImage(
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
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
              TBrandTitleWithVerifiedIcon(title: cartItem.brandName ?? ''),
              Flexible(
                  child: TProductTitleText(
                title: cartItem.title,
                maxLines: 1,
              )),

              ///Attributes
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {})
                      .entries
                      .map(
                        (e) => TextSpan(
                          children: [
                            TextSpan(
                                text: '${e.key}',
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: '${e.value}',
                                style: Theme.of(context).textTheme.bodyLarge),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
