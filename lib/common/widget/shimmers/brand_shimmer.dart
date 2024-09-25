import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/layouts/grid_layout.dart';
import 'package:shopeasy_getx/common/widget/shimmers/shimmer.dart';

class TBrandsShimmer extends StatelessWidget {
  const TBrandsShimmer({super.key, required this.itemCount});
  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return TGridLayout(
        mainAxisExtent: 80,
        itemCount: itemCount,
        itemBuilder: (_, __) => TShimmerEffect(width: 300, height: 80));
  }
}
