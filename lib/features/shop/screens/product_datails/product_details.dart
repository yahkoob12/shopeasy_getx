import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/features/shop/screens/checkout/checkout.dart';
import 'package:shopeasy_getx/features/shop/screens/product_datails/widgets/bottom_add_to_cart_widget.dart';
import 'package:shopeasy_getx/features/shop/screens/product_datails/widgets/product_attributes.dart';

import 'package:shopeasy_getx/features/shop/screens/product_datails/widgets/product_details_image_slider.dart';
import 'package:shopeasy_getx/features/shop/screens/product_datails/widgets/product_meta_data.dart';
import 'package:shopeasy_getx/features/shop/screens/product_datails/widgets/rating_share_widget.dart';
import 'package:shopeasy_getx/features/shop/screens/product_reviews/product_reviews.dart';
import 'package:shopeasy_getx/utils/constants/enums.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

//import 'package:shopeasy/utils/helpers/helper_functions.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    // final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      bottomNavigationBar: TBottomAddToCart(product: product),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///1 - Product Image Slider
            TProductImageSlider(product: product),

            ///2 - Product Details
            Padding(
              padding: EdgeInsets.only(
                  right: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              child: Column(
                children: [
                  /// - Rating & Share button
                  TRatingAndShare(),

                  /// - Price, Title , & Brand
                  TProductMetaData(
                    product: product,
                  ),

                  /// -- Attributes
                  if (product.productType == ProductType.variable.toString())
                    TProductAttributes(
                      product: product,
                    ),
                  if (product.productType == ProductType.variable.toString())
                    SizedBox(
                      height: TSizes.sm,
                    ),

                  /// -- Checkout Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () => Get.to(() => CheckoutScreen()),
                        child: Text('CheckOut')),
                  ),

                  /// - Description
                  TSectionheading(
                    title: 'Description',
                    showActionButton: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  ReadMoreText(
                    product.description ?? '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'Less',
                    moreStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),

                  /// - Reviews
                  Divider(),
                  SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TSectionheading(
                        title: 'Reviews (999)',
                        showActionButton: false,
                      ),
                      IconButton(
                        onPressed: () => Get.to(() => TProductReviewsScreen()),
                        icon: Icon(
                          Iconsax.arrow_right3,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
