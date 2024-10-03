import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/images/circular_image.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = TColors.white,
    this.backgroundColor,
    this.onTap,
    this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
        child: Column(
          children: [
            /// Circular Icon
            TCircularImage(
              image: image,
              fit: BoxFit.fitWidth,
              padding: TSizes.sm * 1.4,
              isNetworkImage: isNetworkImage,
              backgroundColor: backgroundColor,
              overlayColor: dark ? TColors.light : TColors.dark,
            ),
            // Container(
            //   width: 56,
            //   height: 56,
            //   padding: const EdgeInsets.all(TSizes.sm),
            //   decoration: BoxDecoration(
            //     color:
            //         backgroundColor ?? (dark ? TColors.black : TColors.white),
            //     borderRadius: BorderRadius.circular(100),
            //   ),
            //   child: Center(
            //     child: Image(
            //       image: AssetImage(image),
            //       fit: BoxFit.cover,
            //       color: dark ? TColors.light : TColors.dark,
            //     ),
            //   ),
            // ),

            /// Text
            const SizedBox(
              height: TSizes.spaceBtwItems / 2,
            ),
            SizedBox(
                width: 50,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelMedium!.apply(
                        color: textColor,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}






//  Container(
//               width: 56,
//               height: 56,
//               padding: const EdgeInsets.all(TSizes.sm),
//               decoration: BoxDecoration(
//                 color:
//                     backgroundColor ?? (dark ? TColors.black : TColors.white),
//                 borderRadius: BorderRadius.circular(100),
//               ),
//               child: Center(
//                 child: Image(
//                   image: AssetImage(image),
//                   fit: BoxFit.cover,
//                   color: dark ? TColors.light : TColors.dark,
//                 ),
//               ),
//             ),