import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../../../common/common.dart';
import '../../../../../utils/utils.dart';
import '../widgets/custom_list_tile_radio.dart';

class PaymentMethodsScreen extends StatelessWidget {
  const PaymentMethodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: TTexts.paymentMethods),
      bottomNavigationBar: TBottomNavigationContainer(
        text: TTexts.confirmPayment,
        onPressed: () => Get.back(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Credit & Debit Card
            Padding(
              padding: const EdgeInsets.symmetric(vertical: TSizes.size12),
              child: Text(
                TTexts.creditDebitCard,
                style: textTheme.titleMedium,
              ),
            ),

            /// Add Card
            const CustomListTileRadio(
              icon: TImages.paypal,
              title: TTexts.addCard,
              leading: Icon(IconsaxPlusBold.card),
              trailing: Icon(IconsaxPlusLinear.arrow_right_3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(TSizes.size12)),
                side: BorderSide(width: 0.5, color: TColors.borderPrimary),
              ),
            ),

            /// More Payment Options
            Padding(
              padding: const EdgeInsets.only(
                  top: TSizes.defaultSpace, bottom: TSizes.size12),
              child: Text(
                TTexts.morePaymentOptions,
                style: textTheme.titleMedium,
              ),
            ),

            /// Options
            Container(
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.all(Radius.circular(TSizes.size12)),
                border: Border.all(width: 0.5, color: TColors.borderPrimary),
              ),
              child: const Column(
                children: [
                  /// Paypal
                  CustomListTileRadio(
                    icon: TImages.paypal,
                    title: TTexts.paypal,
                    value: 1,
                    groupValue: 1,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(TSizes.size12),
                        topRight: Radius.circular(TSizes.size12),
                      ),
                    ),
                  ),

                  Divider(thickness: 0.5, color: TColors.borderPrimary),

                  /// Apple Pay
                  CustomListTileRadio(
                    icon: TImages.apple,
                    title: TTexts.applePay,
                    value: 2,
                  ),

                  /// Google Pay
                  CustomListTileRadio(
                    icon: TImages.google,
                    title: TTexts.googlePay,
                    value: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(TSizes.size12),
                        bottomRight: Radius.circular(TSizes.size12),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
