import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/circular_container.dart';
import 'package:shopeasy_getx/common/widget/images/rounded_image.dart';
import 'package:shopeasy_getx/common/widget/shimmers/shimmer.dart';
import 'package:shopeasy_getx/features/shop/controllers/banner_controller.dart';
import 'package:shopeasy_getx/features/shop/controllers/home_controller.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';

import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(HomeController());
    final controller = Get.put(BannerController());

    return Obx(
      () {
        // Loader
        if (controller.isLoading.value)
          return TShimmerEffect(width: double.infinity, height: 190);

        // No Data Found
        if (controller.banners.isEmpty) {
          return Center(
            child: Text('No Data Found!'),
          );
        } else {
          return Column(
            children: [
              CarouselSlider(
                items: controller.banners
                    .map((banner) => TRoundedImage(
                          imageUrl: banner.imageUrl,
                          isNetworkImage: true,
                          onPressed: () => Get.toNamed(banner.targetScreen),
                        ))
                    .toList(),
                options: CarouselOptions(
                  viewportFraction: 1,
                  onPageChanged: (index, _) =>
                      controller.updatePageIndicator(index),
                ),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Center(
                child: Obx(
                  () => Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      for (int i = 0; i < controller.banners.length; i++)
                        TCircularContainer(
                          width: 20,
                          height: 4,
                          margin: const EdgeInsets.only(right: 10),
                          backgroundColor:
                              controller.carousalCurrentIndex.value == i
                                  ? TColors.primary
                                  : TColors.grey,
                        ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
