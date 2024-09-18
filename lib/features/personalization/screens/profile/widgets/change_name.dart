import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/features/authentication/controllers/update/update_name_controller.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/constants/text_strings.dart';
import 'package:shopeasy_getx/utils/validators/validation.dart';

class ChangeName extends StatelessWidget {
  const ChangeName({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UpdateNameController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Change Name',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Use real name for easy verification . This name will appear on several pages.',
              style: Theme.of(context).textTheme.labelMedium,
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            /// Text  Field and Button
            Form(
              key: controller.updateUserNameFormKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.firstName,
                    validator: (value) =>
                        TValidator.validateEmptyText('First name', value),
                    expands: false,
                    decoration: InputDecoration(
                        labelText: TTexts.firstName,
                        prefixIcon: Icon(Iconsax.user)),
                  ),
                  SizedBox(
                    height: TSizes.spaceBtwInputFields,
                  ),
                  TextFormField(
                    controller: controller.lastname,
                    validator: (value) =>
                        TValidator.validateEmptyText('Last Name', value),
                    expands: false,
                    decoration: InputDecoration(
                        labelText: TTexts.lastName,
                        prefixIcon: Icon(Iconsax.user)),
                  )
                ],
              ),
            ),
            SizedBox(
              height: TSizes.spaceBtwSections,
            ),

            ///save button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.updateUserNames(),
                child: Text('Save'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
