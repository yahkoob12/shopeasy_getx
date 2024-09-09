import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shopeasy_getx/common/widget/appbar/appbar.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';

import 'package:shopeasy_getx/common/widget/products/cart/coupon_widget.dart';
import 'package:shopeasy_getx/common/widget/success_screen/success_screen.dart';
import 'package:shopeasy_getx/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:shopeasy_getx/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:shopeasy_getx/features/shop/screens/checkout/widgets/billing_paymant_section.dart';
import 'package:shopeasy_getx/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:shopeasy_getx/navigation_menu.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';

import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Order Review',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items In Cart
              TCartItems(
                showAddRemoveButtons: false,
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// -- Coupon TextField
              TCouponCode(),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              /// -- Billing Section
              TRoundedContainer(
                showBorder: true,
                padding: EdgeInsets.all(TSizes.md),
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    /// Pricing
                    TBillingAmountSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Divider
                    Divider(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Payment Methods
                    TBillingPaymentSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),

                    /// Address
                    TBillingAddressSection(),
                    SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /// Checkout Button
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () => Get.to(
                  () => SuccessScreen(
                    image: TImages.successfulPaymentIcon,
                    title: 'Payment Success!',
                    subTitle: 'Your item will be shipped soon!',
                    onPressed: () => Get.offAll(() => NavigationMenu()),
                  ),
                ),
            child: Text('Checkout \$1532')),
      ),
    );
  }
}
