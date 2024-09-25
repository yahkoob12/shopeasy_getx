import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/layouts/grid_layout.dart';
import 'package:shopeasy_getx/common/widget/products/product_cards/product_card_vertical.dart';
import 'package:shopeasy_getx/features/shop/controllers/all_product_controller.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });
  final List<ProductModel> products;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductController());
    controller.assignProducts(products);
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
          onChanged: (value) {
            // Sort Products based on the selected option
            controller.sortProducts(value!);
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Iconsax.sort),
          ),
          value: controller.selectedSortOption.value,
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),

        /// Products
        Obx(
          () => TGridLayout(
            itemCount: controller.products.length,
            itemBuilder: (_, index) => TProductCardVertical(
              product: controller.products[index],
            ),
          ),
        )
      ],
    );
  }
}
