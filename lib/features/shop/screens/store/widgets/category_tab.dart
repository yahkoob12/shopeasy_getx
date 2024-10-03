import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/layouts/grid_layout.dart';
import 'package:shopeasy_getx/common/widget/products/product_cards/product_card_vertical.dart';
import 'package:shopeasy_getx/common/widget/shimmers/vertical_product_shimmer.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/shop/controllers/category_controller.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/product_controller.dart';
import 'package:shopeasy_getx/features/shop/models/category_model.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/features/shop/screens/all_products/all_products.dart';
import 'package:shopeasy_getx/features/shop/screens/store/widgets/category_brands.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/cloud_helper_functions.dart';

class TCategoryTab extends StatelessWidget {
  const TCategoryTab({
    super.key,
    required this.category,
  });
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final productcontroller = Get.put(ProductController());
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// --- Brands
              CategoryBrands(category: category),
              // TBrandShowcase(
              //   images: [
              //     TImages.productImage3,
              //     TImages.productImage2,
              //     TImages.productImage1
              //   ],
              // ),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// --- Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    /// Helper  Function : Handle Loader , No Record ,Or Error Message
                    final response =
                        TCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: TVerticalProductShimmer());

                    //
                    return Column(
                      children: [
                        TSectionheading(
                          title: 'You might like',
                          onPressed: () => Get.to(AllProducts(
                              title: category.name,
                              futureMethod: controller.getCategoryProducts(
                                  categoryId: category.id, limit: -1))),
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        TGridLayout(
                            itemCount:
                                productcontroller.featuredProducts.length,
                            itemBuilder: (_, index) => TProductCardVertical(
                                  product:
                                      productcontroller.featuredProducts[index],
                                )),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}




//  Padding(
//                 padding: EdgeInsets.all(TSizes.defaultSpace),
//                 child: Column(
//                   children: [
//                     /// --- Brands
//                     TBrandShowcase(
//                       images: [
//                         TImages.productImage3,
//                         TImages.productImage2,
//                         TImages.productImage1
//                       ],
//                     )

//                     /// --- Products
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(TSizes.defaultSpace),
//                 child: Column(
//                   children: [
//                     /// --- Brands
//                     TBrandShowcase(
//                       images: [
//                         TImages.productImage3,
//                         TImages.productImage2,
//                         TImages.productImage1
//                       ],
//                     )

//                     /// --- Products
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(TSizes.defaultSpace),
//                 child: Column(
//                   children: [
//                     /// --- Brands
//                     TBrandShowcase(
//                       images: [
//                         TImages.productImage3,
//                         TImages.productImage2,
//                         TImages.productImage1
//                       ],
//                     )

//                     /// --- Products
//                   ],
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.all(TSizes.defaultSpace),
//                 child: Column(
//                   children: [
//                     /// --- Brands
//                     TBrandShowcase(
//                       images: [
//                         TImages.productImage3,
//                         TImages.productImage2,
//                         TImages.productImage1
//                       ],
//                     )

//                     /// --- Products
//                   ],
//                 ),
//               ),