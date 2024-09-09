import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionheading(
          title: 'Shipping Address',
          buttonTitle: 'Change',
          onPressed: () {},
        ),
        Text(
          'Mansoor AliKhan',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Row(
          children: [
            Icon(
              Icons.phone,
              color: Colors.grey,
              size: 16,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              '+91 9747934434',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Row(
          children: [
            Icon(
              Icons.location_history,
              color: Colors.grey,
              size: 16,
            ),
            SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Expanded(
              child: Text(
                'South Liana, Maine 676305, India',
                style: Theme.of(context).textTheme.bodyMedium,
                softWrap: true,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
