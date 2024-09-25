import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/chips/choice_chip.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:shopeasy_getx/common/widget/texts/product_price_text.dart';
import 'package:shopeasy_getx/common/widget/texts/product_title_text.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/variation_controller.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TProductAttributes extends StatelessWidget {
  const TProductAttributes({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
      () => Column(
        children: [
          /// --- Selected Attribute Pricing & Description
          // Display varition price and stock when some variable is selected
          if (controller.selectedVariation.value.id.isNotEmpty)
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
                              if (controller.selectedVariation.value.salePrice >
                                  0)
                                Text(
                                  '\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                ),
                              SizedBox(
                                width: TSizes.sm,
                              ),

                              /// Sale Price
                              TProductPriceText(
                                  price: controller.getVariationPrice()),
                            ],
                          ),
                          Row(
                            children: [
                              TProductTitleText(
                                title: 'Stock : ',
                                smallSize: true,
                              ),
                              Text(
                                controller.variationStockStatus.value,
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
                    title: controller.selectedVariation.value.description ?? '',
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
            children: product.productAttributes!
                .map(
                  (attribute) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TSectionheading(
                        title: attribute.name ?? '',
                        showActionButton: false,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      Obx(
                        () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map((attributeValue) {
                              final isSelected = controller
                                      .selectedAttributes[attribute.name] ==
                                  attributeValue;

                              final available = controller
                                  .getAttributesAvailabilityInVariation(
                                      product.productVariations!,
                                      attribute.name!)
                                  .contains(attributeValue);

                              return TChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name,
                                                attributeValue);
                                          }
                                        }
                                      : null);
                            }).toList()),
                      )
                    ],
                  ),
                )
                .toList(),
          ),

          // Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [
          //     TSectionheading(title: 'Size'),
          //     SizedBox(
          //       height: TSizes.spaceBtwItems / 2,
          //     ),
          //     Wrap(
          //       spacing: 8,
          //       children: [
          //         TChoiceChip(text: '8', selected: true, onSelected: (value) {}),
          //         TChoiceChip(text: '9', selected: false, onSelected: (value) {}),
          //         TChoiceChip(
          //             text: '10', selected: false, onSelected: (value) {}),
          //         TChoiceChip(
          //             text: '11', selected: false, onSelected: (value) {}),
          //       ],
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
