import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/brands/brand_card.dart';
import 'package:shopeasy_getx/common/widget/products/sortable/sortable_products.dart';
import 'package:shopeasy_getx/common/widget/shimmers/vertical_product_shimmer.dart';
import 'package:shopeasy_getx/features/shop/controllers/brand_controller.dart';
import 'package:shopeasy_getx/features/shop/models/brand_model.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});

  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(brand.name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Details
              TBrandCard(
                showBorder: true,
                brand: brand,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              FutureBuilder(
                  future: controller.getBrandProducts(brandId: brand.id),
                  builder: (context, snapshot) {
                    // handle Loader , no record .or Error Message
                    const loader = TVerticalProductShimmer();
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    // Record found
                    final brandProducts = snapshot.data!;
                    return TSortableProducts(
                      products: [],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
