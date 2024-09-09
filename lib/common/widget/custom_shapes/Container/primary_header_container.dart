import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/circular_container.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/curved_edges/curved_edge_widget.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return TCurvedEdgeWidget(
      child: Container(
        color: TColors.primary,
        // padding: const EdgeInsets.only(bottom: 0),
        child: Stack(
          children: [
            ///Background Custom Shapes
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            Positioned(
              top: 100,
              right: -300,
              child: TCircularContainer(
                backgroundColor: TColors.textWhite.withOpacity(0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
