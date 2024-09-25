import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/brands/brand_card.dart';
import 'package:shopeasy_getx/common/widget/layouts/grid_layout.dart';
import 'package:shopeasy_getx/common/widget/shimmers/brand_shimmer.dart';

import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/shop/controllers/brand_controller.dart';
import 'package:shopeasy_getx/features/shop/screens/brand/brand_products.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text('Brand'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Heading
              TSectionheading(title: 'Brands'),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Brands
              Obx(() {
                if (brandController.isLoading.value)
                  return TBrandsShimmer(
                    itemCount: brandController.allBrands.length,
                  );

                if (brandController.allBrands.isEmpty) {
                  return Center(
                    child: Text(
                      'No Data Found! ',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: Colors.white),
                    ),
                  );
                }
                return TGridLayout(
                  itemCount: brandController.allBrands.length,
                  mainAxisExtent: 80,
                  itemBuilder: (_, index) {
                    // In the backend tutorial we will pass the each brand & onPress Event also
                    final brand = brandController.allBrands[index];
                    return TBrandCard(
                        showBorder: true,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(
                              brand: brand,
                            )));
                  },
                );
              }),
              // TGridLayout(
              //   itemCount: 10,
              //   mainAxisExtent: 80,
              //   itemBuilder: (context, index) => TBrandCard(
              //     showBorder: true,
              //     onTap: () => Get.to(() => BrandProducts()),
              //     brand: BrandModel.empty(),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
