import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/shimmers/shimmer.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TCategoryShimmer extends StatelessWidget {
  const TCategoryShimmer({super.key, this.itemCount = 6});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, __) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Image
                TShimmerEffect(width: 55, height: 55),
                SizedBox(
                  height: TSizes.spaceBtwItems / 2,
                ),
                //Text
                TShimmerEffect(width: 55, height: 8)
              ],
            );
          },
          separatorBuilder: (_, __) => SizedBox(width: TSizes.spaceBtwItems),
          itemCount: itemCount),
    );
  }
}
