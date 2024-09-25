import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/products/cart/cart_menu_icon.dart';
import 'package:shopeasy_getx/common/widget/shimmers/shimmer.dart';
import 'package:shopeasy_getx/features/personalization/controllers/user_controller.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/text_strings.dart';

class THomeAppBar extends StatelessWidget {
  const THomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());
    return TAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context).textTheme.labelSmall!.apply(
                  color: TColors.grey,
                ),
          ),
          Obx(() {
            if (controller.profileLoading.value) {
              return TShimmerEffect(width: 80, height: 15);
            } else {
              return Text(controller.user.value.fullName,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: TColors.white,
                      ));
            }
          }),
        ],
      ),
      actions: [
        TCartCounterIcon(
          iconColor: TColors.white,
          counterBgColor: TColors.black,
          counterTextColor: TColors.white,
        ),
      ],
    );
  }
}
