import 'package:flutter/material.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subTitle,
  });
  final String image, title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          const SizedBox(height: 100),
          Image(
            fit: BoxFit.fill,
            width: 300, height: 300,
            // width: THelperFunctions.screenHeight() * 0.9,
            // height: THelperFunctions.screenHeight() * 0.7,
            image: AssetImage(
              image,
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(title,
              style: Theme.of(context).textTheme.headlineMedium,
              textAlign: TextAlign.center),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            subTitle,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
