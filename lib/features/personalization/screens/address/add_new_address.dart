import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            child: Column(
              children: [
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: 'Name',
                  ),
                ),
                SizedBox(
                  height: TSizes.spaceBtwInputFields,
                ),
                TextFormField(
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
                  decoration: InputDecoration(
                      prefixIcon: Icon(Iconsax.global), labelText: 'Country'),
                ),
                SizedBox(
                  height: TSizes.defaultSpace,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
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
