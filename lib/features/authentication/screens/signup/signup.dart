import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/signup/form_divider.dart';
import 'package:shopeasy_getx/common/widget/signup/social_buttons.dart';
import 'package:shopeasy_getx/features/authentication/screens/signup/widgets/signupform.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ///Title
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Form
              const TSignupForm(),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignUpWith.capitalize!),

              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              ///Social Buttons
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
