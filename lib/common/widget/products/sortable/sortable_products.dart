import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/layouts/grid_layout.dart';
import 'package:shopeasy_getx/common/widget/products/product_cards/product_card_vertical.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //// Dropdown
        DropdownButtonFormField(
          items: [
            'Name',
            'Higher Price',
            'Lower Price',
            'Sale',
            'Newest',
            'Popularity'
          ]
              .map((option) =>
                  DropdownMenuItem(value: option, child: Text(option)))
              .toList(),
          onChanged: (value) {},
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// Products
        TGridLayout(
            itemCount: 100, itemBuilder: (_, index) => TProductCardVertical())
      ],
    );
  }
}
