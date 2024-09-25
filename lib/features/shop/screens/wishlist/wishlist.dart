import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/icons/t_circular_icon.dart';
import 'package:shopeasy_getx/common/widget/layouts/grid_layout.dart';
import 'package:shopeasy_getx/common/widget/products/product_cards/product_card_vertical.dart';
import 'package:shopeasy_getx/common/widget/shimmers/vertical_product_shimmer.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/favourite_controller.dart';
import 'package:shopeasy_getx/features/shop/screens/home/home.dart';
import 'package:shopeasy_getx/navigation_menu.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/cloud_helper_functions.dart';
import 'package:shopeasy_getx/utils/popups/animation_loader.dart';

class FevouriteScreen extends StatelessWidget {
  const FevouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouriteController());
    // final controller = FavouriteController.instance;
    return Scaffold(
      appBar: TAppBar(
        title: Text(
          'Wishlist',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCircularIcon(
            icon: Iconsax.add,
            onPressed: () => Get.to(HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                future: controller.favoriteProducts(),
                builder: (context, snapshot) {
                  /// Nothing not found
                  final emptyWidget = TAnimationLoaderWidget(
                    text: 'Whoops ! Whishlist is Empty',
                    animation: TImages.pencilAnimation,
                    showAction: true,
                    actionText: 'Let\s add some',
                    onActionPressed: () => Get.off(() => NavigationMenu()),
                  );
                  const loader = TVerticalProductShimmer(
                    itemCount: 6,
                  );
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot,
                      loader: loader,
                      nothingFound: emptyWidget);
                  if (widget != null) return widget;

                  final products = snapshot.data!;
                  return TGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) =>
                          TProductCardVertical(product: products[index]));
                }),
          ),
        ),
      ),
    );
  }
}
