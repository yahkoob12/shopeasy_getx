import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/shimmers/shimmer.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TBoxesShimmer extends StatelessWidget {
  const TBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(child: TShimmerEffect(width: 150, height: 110)),
          ],
        )
      ],
    );
  }
}
