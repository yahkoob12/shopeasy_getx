import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopeasy_getx/common/widget/texts/section_heading.dart';
import 'package:shopeasy_getx/features/shop/models/payment_method_model.dart';
import 'package:shopeasy_getx/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:shopeasy_getx/utils/constants/image_strings.dart';
import 'package:shopeasy_getx/utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: TImages.paypal);
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(TSizes.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TSectionheading(
                      title: 'Select a payment method',
                      showActionButton: false,
                    ),
                    SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.paypal, name: 'Paypal')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.googlePay, name: 'Google pay')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.applePay, name: 'Apple pay')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.visa, name: 'VISA')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.masterCard, name: 'Master Card')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.paytm, name: 'Paytm')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.paystack, name: 'PayStack')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                    TPaymentTile(
                        paymentMethod: PaymentMethodModel(
                            image: TImages.creditCard, name: 'Credit Card')),
                    SizedBox(
                      height: TSizes.spaceBtwItems / 2,
                    ),
                  ],
                ),
              ),
            ));
  }
}
