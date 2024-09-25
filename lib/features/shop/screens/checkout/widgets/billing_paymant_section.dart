import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/custom_shapes/Container/rounded_container.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/shop/controllers/product/checkout_controller.dart';
import 'package:shopeasy_getx/features/shop/models/payment_method_model.dart';
import 'package:shopeasy_getx/utils/constants/colors.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';
import 'package:shopeasy_getx/utils/helpers/helper_functions.dart';

class TBillingPaymentSection extends StatelessWidget {
  const TBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(CheckoutController());
    return Column(
      children: [
        TSectionheading(
          title: 'Payment Method',
          buttonTitle: 'Change',
          onPressed: () =>
              controller.selectedPaymentMethod(context as PaymentMethodModel?),
        ),
        SizedBox(
          height: TSizes.spaceBtwItems / 2,
        ),
        Obx(
          () => Row(
            children: [
              TRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: dark ? TColors.light : TColors.white,
                padding: EdgeInsets.all(TSizes.sm),
                child: Image(
                  image:
                      AssetImage(controller.selectedPaymentMethod.value.image),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                width: TSizes.spaceBtwItems / 2,
              ),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
