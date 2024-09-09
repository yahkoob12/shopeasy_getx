import 'package:flutter/material.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/brands/brand_card.dart';
import 'package:shopeasy_getx/common/widget/products/sortable/sortable_products.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Brand Details
              TBrandCard(showBorder: true),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TSortableProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
