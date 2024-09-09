import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/styles/spacing_style.dart';
import 'package:shopeasy_getx/common/widget/signup/form_divider.dart';
import 'package:shopeasy_getx/common/widget/signup/social_buttons.dart';
import 'package:shopeasy_getx/features/authentication/screens/login/widgets/login_form.dart';
import 'package:shopeasy_getx/features/authentication/screens/login/widgets/login_header.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/constants/text_strings.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              ///Logo , Title & Sub-Title
              const LoginHeader(),

              ///Form
              const LoginForm(),

              ///Divider
              TFormDivider(dividerText: TTexts.orSignInWith.capitalize!),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              ///Footer
              const TSocialButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
