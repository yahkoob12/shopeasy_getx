import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/shimmers/shimmer.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TListTileShimmer extends StatelessWidget {
  const TListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TShimmerEffect(
          width: 50,
          height: 50,
          radius: 50,
        ),
        SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Column(
          children: [
            TShimmerEffect(width: 100, height: 15),
            SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            TShimmerEffect(width: 80, height: 12)
          ],
        )
      ],
    );
  }
}
