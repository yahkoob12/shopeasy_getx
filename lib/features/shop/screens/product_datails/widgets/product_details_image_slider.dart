import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:shopeasy_getx/common/widget/images/rounded_image.dart';
import 'package:shopeasy_getx/common/widget/products/fevourite_icon/fevourite_icon.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/image_controller.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(ImagesController());
    final images = controller.getAllProductImages(product);
    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkerGrey : TColors.light,
        child: Stack(
          children: [
            /// Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) =>
                            CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: TColors.primary,
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),

            /// Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemBuilder: (_, index) => Obx(() {
                    final imageSelected =
                        controller.selectedProductImage.value == images[index];
                    return TRoundedImage(
                      isNetworkImage: true,
                      imageUrl: images[index],
                      width: 80,
                      backgroundColor: dark ? TColors.dark : TColors.white,
                      onPressed: () =>
                          controller.selectedProductImage.value = images[index],
                      border: Border.all(
                          color: imageSelected
                              ? TColors.primary
                              : Colors.transparent),
                      padding: EdgeInsets.all(TSizes.sm),
                    );
                  }),
                  separatorBuilder: (_, __) => SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),

            /// Appbar Icons
            TAppBar(
              showBackArrow: true,
              actions: [
                TFevouriteIcon(
                  productId: product.id,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
