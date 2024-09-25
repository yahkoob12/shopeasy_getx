import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';

import 'package:shopeasy_getx/common/widget/images/rounded_image.dart';
import 'package:shopeasy_getx/common/widget/products/product_cards/product_card_horizontal.dart';
import 'package:shopeasy_getx/common/widget/shimmers/horizontal_product_shimmer.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/shop/controllers/category_controller.dart';
import 'package:shopeasy_getx/features/shop/models/category_model.dart';
import 'package:shopeasy_getx/features/shop/screens/all_products/all_products.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/cloud_helper_functions.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(category.name),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TRoundedImage(
                imageUrl: TImages.promoBanner3,
                applyImageRadius: true,
                width: double.infinity,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sub - Category
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    /// Handle Loader , no Record . Or Error Message
                    const loader = THorizontalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record Found
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];
                          return FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryId: subCategory.id),
                              builder: (context, snapshot) {
                                /// Handle Loader , no Record . Or Error Message
                                const loader = THorizontalProductShimmer();
                                final widget =
                                    TCloudHelperFunctions.checkMultiRecordState(
                                        snapshot: snapshot, loader: loader);
                                if (widget != null) return widget;

                                // Record Found
                                final products = snapshot.data!;
                                return Column(
                                  children: [
                                    /// Heading
                                    TSectionheading(
                                      title: subCategory.name,
                                      onPressed: () => Get.to(() => AllProducts(
                                            title: subCategory.name,
                                            futureMethod:
                                                controller.getCategoryProducts(
                                                    categoryId: subCategory.id,
                                                    limit: -1),
                                          )),
                                    ),
                                    SizedBox(
                                      height: TSizes.spaceBtwItems / 2,
                                    ),
                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                          itemCount: products.length,
                                          scrollDirection: Axis.horizontal,
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                width: TSizes.spaceBtwItems,
                                              ),
                                          itemBuilder: (context, index) =>
                                              TProductCardHorizontal(
                                                  product: products[index])),
                                    ),

                                    SizedBox(
                                      height: TSizes.spaceBtwSections,
                                    )

                                    ///
                                  ],
                                );
                              });
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
