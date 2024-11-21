import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/appbar/tabbar.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/search_container.dart';
import 'package:shopeasy_getx/common/widget/layouts/grid_layout.dart';
import 'package:shopeasy_getx/common/widget/brands/brand_card.dart';
import 'package:shopeasy_getx/common/widget/products/cart/cart_menu_icon.dart';
import 'package:shopeasy_getx/common/widget/shimmers/brand_shimmer.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/shop/controllers/brand_controller.dart';
import 'package:shopeasy_getx/features/shop/controllers/category_controller.dart';
import 'package:shopeasy_getx/features/shop/screens/brand/all_brands.dart';
import 'package:shopeasy_getx/features/shop/screens/brand/brand_products.dart';
import 'package:shopeasy_getx/features/shop/screens/store/widgets/category_tab.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// --- Appbar
        appBar: TAppBar(
          title: Text(
            'Store',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          actions: [
            TCartCounterIcon(
              iconColor: Colors.blue,
            ),
          ],
        ),
        body: NestedScrollView(
          /// --- Header
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: THelperFunctions.isDarkMode(context)
                    ? TColors.black
                    : TColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      /// ---- Search bar
                      const SizedBox(
                        height: TSizes.spaceBtwItems,
                      ),
                      TSearchBarContainer(
                        text: 'Search in Store',
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections,
                      ),

                      /// ---- Featured Brands
                      TSectionheading(
                        title: 'Featured Brands',
                        onPressed: () => Get.to(() => AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: TSizes.spaceBtwSections / 1.5,
                      ),

                      /// --- Brand GRID

                      Obx(() {
                        if (brandController.isLoading.value)
                          return TBrandsShimmer(
                            itemCount: brandController.featuredBrands.length,
                          );

                        if (brandController.featuredBrands.isEmpty) {
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
                          itemCount: brandController.featuredBrands.length,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            // In the backend tutorial we will pass the each brand & onPress Event also
                            final brand = brandController.featuredBrands[index];
                            return TBrandCard(
                                showBorder: true,
                                brand: brand,
                                onTap: () =>
                                    Get.to(() => BrandProducts(brand: brand)));
                          },
                        );
                      }),
                    ],
                  ),
                ),

                /// ----Tabs
                bottom: TTabBar(
                  tabs: categories
                      .map((category) => Tab(
                            child: Text(category.name),
                          ))
                      .toList(),
                ),
              ),
            ];
          },

          /// --- Body
          body: TabBarView(
            children: categories
                .map((category) => TCategoryTab(
                      category: category,
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
