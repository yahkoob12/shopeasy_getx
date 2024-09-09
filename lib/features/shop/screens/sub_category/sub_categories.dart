import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';

import 'package:shopeasy_getx/common/widget/images/rounded_image.dart';
import 'package:shopeasy_getx/common/widget/products/product_cards/product_card_horizontal.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Sports shirts'),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// Banner
              TRoundedImage(
                imageUrl: TImages.promoBanner3,
                applyImageRadius: true,
                width: double.infinity,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// Sub - Category
              Column(
                children: [
                  /// Heading
                  TSectionheading(
                    title: 'Sports shirts',
                    onPressed: () {},
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        itemCount: 4,
                        scrollDirection: Axis.horizontal,
                        separatorBuilder: (context, index) => SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                        itemBuilder: (context, index) =>
                            TProductCardHorizontal()),
                  ),

                  ///
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
