import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/features/personalization/controllers/address_controller.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/validators/validation.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text('Add New Address'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(
            TSizes.defaultSpace,
          ),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.name,
                  validator: (value) =>
                      TValidator.validateEmptyText('Name', value),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.phoneNumber,
                  validator: TValidator.validatePhoneNumber,
                  decoration: InputDecoration(
                    prefixIcon: Icon(
                      Iconsax.mobile,
                    ),
                    labelText: 'Phone Number',
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.street,
                        validator: (value) =>
                            TValidator.validateEmptyText('Street', value),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.building_31,
                            ),
                            labelText: 'Street'),
                      ),
                    ),
                    SizedBox(
                      width: TSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.postalCode,
                        validator: (value) =>
                            TValidator.validateEmptyText('Postal Code', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.code,
                          ),
                          labelText: 'Postal code',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: controller.city,
                        validator: (value) =>
                            TValidator.validateEmptyText('City', value),
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Iconsax.buliding,
                            ),
                            labelText: 'City'),
                      ),
                    ),
                    SizedBox(
                      width: TSizes.spaceBtwInputFields,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: controller.state,
                        validator: (value) =>
                            TValidator.validateEmptyText('State', value),
                        decoration: InputDecoration(
                          prefixIcon: Icon(
                            Iconsax.activity,
                          ),
                          labelText: 'State',
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
                  controller: controller.country,
                  validator: (value) =>
                      TValidator.validateEmptyText('Country', value),
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                SizedBox(
                  height: TSizes.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.addNewAddress,
                    child: Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
