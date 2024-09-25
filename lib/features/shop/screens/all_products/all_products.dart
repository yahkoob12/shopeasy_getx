import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';

import 'package:shopeasy_getx/common/widget/products/sortable/sortable_products.dart';
import 'package:shopeasy_getx/common/widget/shimmers/vertical_product_shimmer.dart';
import 'package:shopeasy_getx/features/shop/controllers/all_product_controller.dart';
import 'package:shopeasy_getx/features/shop/models/product_model.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/cloud_helper_functions.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({
    super.key,
    required this.title,
    this.query,
    this.futureMethod,
  });

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    //initialize controller for managing product fetching
    final controller = Get.put(AllProductController());
    return Scaffold(
      /// AppBar
      appBar: TAppBar(
        title: Text(title),
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                // check the state of the FutureBuilder snapshot
                const loader = TVerticalProductShimmer();

                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot, loader: loader);

                // Return appropriate widget based on snapshot state

                if (widget != null) return widget;

                // if (snapshot.connectionState == ConnectionState.waiting) {
                //   return loader;
                // }
                // if (!snapshot.hasData ||
                //     snapshot.data == null ||
                //     snapshot.data!.isEmpty) {
                //   return Center(
                //     child: Text('No Data Found'),
                //   );
                // }

                // if (snapshot.hasError) {
                //   return Center(child: Text('Something Went Wrong'));
                // }

                // Products found
                final products = snapshot.data!;

                return TSortableProducts(
                  products: products,
                );
              }),
        ),
      ),
    );
  }
}
