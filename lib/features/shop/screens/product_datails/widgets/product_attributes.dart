import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/chips/choice_chip.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:shopeasy_getx/common/widget/texts/product_price_text.dart';
import 'package:shopeasy_getx/common/widget/texts/product_title_text.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Column(
      children: [
        /// --- Selected Attribute Pricing & Description
        TRoundedContainer(
          padding: EdgeInsets.all(TSizes.md),
          backgroundColor: dark ? TColors.darkGrey : TColors.grey,
          child: Column(
            children: [
              /// Title ,Price and Stock Status
              Row(
                children: [
                  TSectionheading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TProductTitleText(
                            title: 'price : ',
                            smallSize: true,
                          ),
                          // SizedBox(
                          //   width: TSizes.spaceBtwItems,
                          // ),

                          /// Actual Price
                          Text(
                            '\&25',
                            style:
                                Theme.of(context).textTheme.titleSmall!.apply(
                                      decoration: TextDecoration.lineThrough,
                                    ),
                          ),
                          SizedBox(
                            width: TSizes.sm,
                          ),

                          /// Sale Price
                          TProductPriceText(price: '20'),
                        ],
                      ),
                      Row(
                        children: [
                          TProductTitleText(
                            title: 'Stock : ',
                            smallSize: true,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),

              /// Variation Description
              TProductTitleText(
                title:
                    'This is the Description of the Product and it can go up to max 4 lines . Limited edition for the price',
                smallSize: true,
                maxLines: 2,
              ),
            ],
          ),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// --- Attributes
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionheading(title: 'Colors'),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(
                    text: 'Green', selected: true, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Blue', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Yellow', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: 'Red', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TSectionheading(title: 'Size'),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            Wrap(
              spacing: 8,
              children: [
                TChoiceChip(text: '8', selected: true, onSelected: (value) {}),
                TChoiceChip(text: '9', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: '10', selected: false, onSelected: (value) {}),
                TChoiceChip(
                    text: '11', selected: false, onSelected: (value) {}),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
