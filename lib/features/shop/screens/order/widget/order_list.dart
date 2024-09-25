import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/order_controller.dart';
import 'package:shopeasy_getx/navigation_menu.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/cloud_helper_functions.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';
import 'package:shopeasy_getx/utils/popups/animation_loader.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final dark = THelperFunctions.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrder(),
        builder: (_, snapshot) {
          // Nothing Found widget
          final emptyWidget = TAnimationLoaderWidget(
            text: 'Whoops! No order yet',
            animation: TImages.orderCompletedAnimation,
            showAction: true,
            actionText: 'Let\'s fill it',
            onActionPressed: () => Get.off(() => NavigationMenu()),
          );

          /// Helper Function : handle Loader , no Record or Error Message
          final response = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);
          if (response != null) return response;

          /// Congratulations record Found
          final orders = snapshot.data!;
          return ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_, index) => SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final order = orders[index];
                TRoundedContainer(
                  showBorder: true,
                  padding: EdgeInsets.all(TSizes.md),
                  backgroundColor: dark ? TColors.dark : TColors.light,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      /// -- Row 1
                      Row(
                        children: [
                          /// 1 - Icon
                          Icon(Iconsax.ship),
                          SizedBox(
                            width: TSizes.spaceBtwItems / 2,
                          ),

                          /// 2 -- Status & Data
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.OrderStatusText,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .apply(
                                          color: TColors.primary,
                                          fontWeightDelta: 1),
                                ),
                                Text(
                                  order.formattedOrderDate,
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ),
                              ],
                            ),
                          ),

                          /// 3 - Icon
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Iconsax.arrow_right_34,
                              size: TSizes.iconSm,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),

                      /// -- Row - 2
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                /// 1 - Icon
                                Icon(Iconsax.tag),
                                SizedBox(
                                  width: TSizes.spaceBtwItems / 2,
                                ),

                                /// 2 -- Status & Data
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Order',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      Text(
                                        order.id,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                /// 1 - Icon
                                Icon(Iconsax.calendar),
                                SizedBox(
                                  width: TSizes.spaceBtwItems / 2,
                                ),

                                /// 2 - Status & Date
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        'shipping Date',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelMedium,
                                      ),
                                      Text(
                                        order.formattedDeliveryDate,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
                return null;
              });
        });
  }
}
