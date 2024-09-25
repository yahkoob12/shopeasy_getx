import 'package:flutter/widgets.dart';
import 'package:shopeasy_getx/common/widget/shimmers/shimmer.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class THorizontalProductShimmer extends StatelessWidget {
  const THorizontalProductShimmer({
    super.key,
    this.itemCount = 4,
  });
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: TSizes.spaceBtwItems),
      height: 120,
      child: ListView.separated(
          itemCount: itemCount,
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (context, index) => SizedBox(
                width: TSizes.spaceBtwItems,
              ),
          itemBuilder: (_, __) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  /// Image
                  TShimmerEffect(width: 120, height: 120),
                  SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),

                  //Text

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TShimmerEffect(width: 160, height: 15),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TShimmerEffect(width: 110, height: 15),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TShimmerEffect(width: 80, height: 15),
                      Spacer()
                    ],
                  )
                ],
              )),
    );
  }
}
