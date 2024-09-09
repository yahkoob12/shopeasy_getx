import 'package:flutter/material.dart';

import 'package:readmore/readmore.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:shopeasy_getx/common/widget/products/rating/rating_indicator.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TUserReviewCard extends StatelessWidget {
  const TUserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(TImages.userProfileImage1),
                ),
                SizedBox(
                  width: TSizes.spaceBtwItems,
                ),
                Text(
                  'John Doe',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_vert),
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Reviews
        Row(
          children: [
            TRatingBarIndicator(
              rating: 4,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '01 Nov , 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),
        ReadMoreText(
          "I’m really happy with this shirt. It’s comfortable, stylish, and versatile—everything I was looking for. It’s become one of my go-to shirts for both work and casual outings. I would definitely recommend it to anyone looking for a high-quality, all-purpose shirt.",
          trimLines: 2,
          trimExpandedText: 'show less',
          trimCollapsedText: 'show more',
          trimMode: TrimMode.Line,
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: TColors.primary),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        /// Company Reviews
        TRoundedContainer(
          backgroundColor: dark ? TColors.darkerGrey : TColors.grey,
          child: Padding(
            padding: EdgeInsets.all(TSizes.md),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Nike",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      '02 Nov , 2024',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                ReadMoreText(
                  'Working with shopeasy Solutions has been a great experience. Their blend of professionalism, expertise, and customer focus makes them stand out in the tech industry. They’ve consistently delivered high-quality results, and I trust them with my most critical projects. While their services are a bit on the expensive side, the value they provide makes it worthwhile. I would highly recommend TechWave Solutions to any company looking for reliable and expert tech solutions.',
                  trimLines: 2,
                  trimExpandedText: 'show less',
                  trimCollapsedText: 'show more',
                  trimMode: TrimMode.Line,
                  moreStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                  lessStyle: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: TColors.primary),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: TSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
