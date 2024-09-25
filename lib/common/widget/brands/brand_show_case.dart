import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/brands/brand_card.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:shopeasy_getx/common/widget/shimmers/shimmer.dart';
import 'package:shopeasy_getx/features/shop/models/brand_model.dart';
import 'package:shopeasy_getx/features/shop/screens/brand/brand_products.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';

import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TBrandShowcase extends StatelessWidget {
  const TBrandShowcase({
    super.key,
    required this.images,
    required this.brand,
  });
  final List<String> images;
  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(
            brand: brand,
          )),
      child: TRoundedContainer(
        showBorder: true,
        borderColor: TColors.darkGrey,
        padding: EdgeInsets.all(TSizes.md),
        backgroundColor: Colors.transparent,
        margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Brand with Products Count
            TBrandCard(
              showBorder: true,
              brand: brand,
            ),
            SizedBox(
              height: TSizes.spaceBtwItems,
            ),

            /// Brand Top 3 Products Images
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
          height: 100,
          padding: EdgeInsets.all(TSizes.md),
          margin: EdgeInsets.only(right: TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkGrey
              : TColors.light,
          child: CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: image,
            progressIndicatorBuilder: (context, url, DownloadProgress) =>
                TShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => Icon(Icons.error),
          )),
    );
  }
}
