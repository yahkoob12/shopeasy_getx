import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/primary_header_container.dart';

import 'package:shopeasy_getx/common/widget/custom_shapes/Container/search_container.dart';
import 'package:shopeasy_getx/common/widget/layouts/grid_layout.dart';
import 'package:shopeasy_getx/common/widget/products/product_cards/product_card_vertical.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/shop/screens/all_products/all_products.dart';
import 'package:shopeasy_getx/features/shop/screens/home/widget/home_appbar.dart';
import 'package:shopeasy_getx/features/shop/screens/home/widget/home_categories.dart';
import 'package:shopeasy_getx/features/shop/screens/home/widget/promo_slider.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';

import 'package:shopeasy_getx/utils/constants/sizes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //////----------------------------Orginal code start-----------------------------------//////

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///Header
            const TPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// --- AppBar
                  THomeAppBar(),
                  SizedBox(height: TSizes.spaceBtwSections),

                  /// --- SearchBar
                  TSearchBarContainer(
                    text: 'Search in Store',
                    showBorder: false,
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  // / --- Categories
                  Padding(
                    padding: EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        ///--- Headings
                        TSectionheading(
                          title: "Popular Categories",
                          showActionButton: false,
                          textColor: Colors.white,
                        ),
                        SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),

                        ///Category
                        THomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),

            /// Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  /// --- Promo  Slider
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),

                  /// Heading
                  TSectionheading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => AllProducts()),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  /// --- Popular Product
                  TGridLayout(
                    itemBuilder: (_, index) => const TProductCardVertical(),
                    itemCount: 8,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

    /////----------------------------- orginal code end-------------------------------//////
  }
}






////------  without design code---------------------------/////
///  // return Scaffold(
    //   body: SingleChildScrollView(
    //     child: Column(children: [
    //       ///Header

    //       Column(
    //         children: [
    //           /// --- AppBar
    //           THomeAppBar(),
    //           SizedBox(height: TSizes.spaceBtwSections),

    //           /// --- SearchBar
    //           TSearchBarContainer(
    //             text: 'Search in Store',
    //             showBorder: false,
    //           ),
    //           SizedBox(
    //             height: TSizes.spaceBtwSections,
    //           ),

    //           // / --- Categories
    //           Padding(
    //             padding: EdgeInsets.only(left: TSizes.defaultSpace),
    //             child: Column(
    //               children: [
    //                 ///--- Headings
    //                 TSectionheading(
    //                   title: "Popular Categories",
    //                   showActionButton: false,
    //                   textColor: Colors.white,
    //                 ),
    //                 SizedBox(
    //                   height: TSizes.spaceBtwItems,
    //                 ),

    //                 ///Category
    //                 THomeCategories(),
    //               ],
    //             ),
    //           ),

    //           /// Body
    //           Padding(
    //             padding: const EdgeInsets.all(TSizes.defaultSpace),
    //             child: Column(
    //               children: [
    //                 /// --- Promo  Slider
    //                 const TPromoSlider(
    //                   banners: [
    //                     TImages.promoBanner1,
    //                     TImages.promoBanner2,
    //                     TImages.promoBanner3,
    //                   ],
    //                 ),
    //                 const SizedBox(
    //                   height: TSizes.spaceBtwSections,
    //                 ),

    //                 /// Heading
    //                 TSectionheading(
    //                   title: 'Popular Products',
    //                   onPressed: () {},
    //                 ),
    //                 const SizedBox(height: TSizes.spaceBtwItems),

    //                 /// --- Popular Product
    //                 TGridLayout(
    //                   itemBuilder: (_, index) => const TProductCardVertical(),
    //                   itemCount: 8,
    //                 ),
    //               ],
    //             ),
    //           ),
    //         ],
    //       ),
    //     ]),
    //   ),
    // );


    ////// ------------------- end  of with out design code  ----------------////