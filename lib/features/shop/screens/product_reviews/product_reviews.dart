import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/products/rating/rating_indicator.dart';

import 'package:shopeasy_getx/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:shopeasy_getx/features/shop/screens/product_reviews/widgets/user_review_card.dart';

import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TProductReviewsScreen extends StatelessWidget {
  const TProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- AppBar
      appBar: TAppBar(
        title: Text('Reviews & Ratings'),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  'Rating and reviews are verified and are from people who use the same type of device that you use .'),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              /// Overall Product Ratings
              TOverallProductRating(),
              TRatingBarIndicator(rating: 3.5),
              Text('12345', style: Theme.of(context).textTheme.bodySmall),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// User Reviews List
              TUserReviewCard(), TUserReviewCard(), TUserReviewCard(),
              TUserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}
