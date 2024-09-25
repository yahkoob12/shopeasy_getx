import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/icons/t_circular_icon.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/favourite_controller.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';

class TFevouriteIcon extends StatelessWidget {
  const TFevouriteIcon({super.key, required this.productId});
  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    return Obx(
      () => TCircularIcon(
        icon:
            controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        color: controller.isFavourite(productId) ? TColors.error : null,
        onPressed: () => controller.toggleFavoriteProducts(productId),
      ),
    );
  }
}
