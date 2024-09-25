import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/brands/brand_show_case.dart';
import 'package:shopeasy_getx/common/widget/shimmers/BoxesShimmer.dart';
import 'package:shopeasy_getx/common/widget/shimmers/ListTileShimmer.dart';
import 'package:shopeasy_getx/features/shop/controllers/brand_controller.dart';
import 'package:shopeasy_getx/features/shop/models/brand_model.dart';
import 'package:shopeasy_getx/features/shop/models/category_model.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/cloud_helper_functions.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          // Handle Loader . No Record , OR Error Message
          const loader = Column(
            children: [
              TListTileShimmer(),
              SizedBox(height: TSizes.spaceBtwItems),
              TBoxesShimmer(),
              SizedBox(
                height: TSizes.spaceBtwItems,
              )
            ],
          );

          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          /// Record Found
          final brands = snapshot.data!;
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    ///Handle Loader ,No Record ,OR Error Message
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found
                    final products = snapshot.data!;

                    return TBrandShowcase(
                      images: products.map((e) => e.thumbnail).toList(),
                      brand: BrandModel.empty(),
                    );
                  });
            },
          );
        });
  }
}
