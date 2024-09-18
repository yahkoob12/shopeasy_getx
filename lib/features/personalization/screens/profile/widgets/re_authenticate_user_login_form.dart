import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shopeasy_getx/features/personalization/controllers/user_controller.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/constants/text_strings.dart';
import 'package:shopeasy_getx/utils/validators/validation.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(
        title: Text('Re-Authenticator User'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Form(
            child: Padding(
              padding: EdgeInsets.all(TSizes.defaultSpace),
              child: Form(
                key: controller.reAuthFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  /// Email
                  children: [
                    TextFormField(
                      controller: controller.verifyEmail,
                      validator: TValidator.validateEmail,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Iconsax.direct_right),
                          labelText: TTexts.email),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwInputFields,
                    ),

                    /// Password
                    Obx(
                      () => TextFormField(
                        obscureText: controller.hidePassword.value,
                        controller: controller.verifyPassword,
                        validator: (value) =>
                            TValidator.validateEmptyText('Password', value),
                        decoration: InputDecoration(
                          labelText: TTexts.password,
                          prefixIcon: Icon(Iconsax.password_check),
                          suffixIcon: IconButton(
                            onPressed: () => controller.hidePassword.value =
                                !controller.hidePassword.value,
                            icon: Icon(Iconsax.eye_slash),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),

                    /// Login Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        // controller.reAuthenticateEmailAndPasswordUser(),
                        child: Text('verify'),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
