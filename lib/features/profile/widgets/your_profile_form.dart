import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';
import '../controllers/your_profile.controller.dart';

class YourProfileForm extends StatelessWidget {
  const YourProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = YourProfileController.instance;
    return Form(
        key: controller.yourProfileFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: TSizes.spaceBtwItems),

            /// Name
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TTexts.name,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: TSizes.size6),
                  TextFormField(
                    controller: controller.name,
                    validator: (value) =>
                        TValidators.validateEmptyText(TTexts.name, value),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.size20),

            /// Phone Number
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TTexts.phoneNumber,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: TSizes.size6),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: controller.phoneNumber,
                    validator: (value) =>
                        TValidators.validatePhoneNumber(value),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.size20),

            /// Email
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(TTexts.email,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: TSizes.size6),
                  TextFormField(
                    controller: controller.email,
                    validator: (value) => TValidators.validateEmail(value),
                  ),
                ],
              ),
            ),

            const SizedBox(height: TSizes.size20),

            /// Gender
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Gender
                  Text(
                    TTexts.gender,
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(height: TSizes.size6),

                  /// DropdownButton
                  Container(
                    height: TSizes.size44,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.size8, horizontal: TSizes.size16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(TSizes.size8),
                      border: Border.all(color: TColors.borderPrimary),
                    ),
                    child: Obx(
                      () => DropdownButton<String>(
                        hint: const Text('Select'),
                        isExpanded: true,
                        elevation: 10,
                        value: controller.gender.value.isEmpty
                            ? null
                            : controller.gender.value,
                        onChanged: (String? newValue) {
                          controller.gender.value = newValue ?? '';
                        },
                        underline: const SizedBox(height: 0.0),
                        dropdownColor: TColors.whiteSmoke,
                        style: const TextStyle(
                            fontSize: TSizes.fontSize15,
                            color: TColors.black,
                            fontWeight: FontWeight.w500),
                        icon: const Padding(
                          padding: EdgeInsets.only(left: TSizes.xs),
                          child: Icon(IconsaxPlusLinear.arrow_down,
                              color: TColors.green),
                        ),
                        items: controller.genders
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
