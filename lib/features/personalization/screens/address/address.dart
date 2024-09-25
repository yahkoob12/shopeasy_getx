import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/features/personalization/controllers/address_controller.dart';

import 'package:shopeasy_getx/features/personalization/screens/address/add_new_address.dart';
import 'package:shopeasy_getx/features/personalization/screens/address/widgets/single_address.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/cloud_helper_functions.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: TColors.primary,
        onPressed: () => Get.to(
          () => AddNewAddressScreen(),
        ),
        child: Icon(
          Iconsax.add,
          color: TColors.white,
        ),
      ),
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Address',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                // Use Key to trigger refresh
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddress(),
                builder: (context, snapshot) {
                  /// Helper function : handle loader , no Record OR Error Message
                  final response = TCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (response != null) return response;

                  final addresses = snapshot.data!;
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => TSingleAddress(
                            address: addresses[index],
                            onTap: () =>
                                controller.selectedAddress(addresses[index]),
                          ));
                }),
          ),
        ),
      ),
    );
  }
}
