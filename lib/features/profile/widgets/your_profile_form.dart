import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../utils/utils.dart';
import '../controllers/your_profile.controller.dart';

class YourProfileForm extends StatelessWidget {
  const YourProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(YourProfileController());
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
                    validator: (value) => TValidators.validateEmail(value),
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
                    validator: (value) => TValidators.validateEmail(value),
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
                  Text(TTexts.gender,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(fontWeight: FontWeight.w500)),
                  const SizedBox(height: TSizes.size6),
                  Container(
                    height: TSizes.size44,
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                        vertical: TSizes.size8, horizontal: TSizes.size16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(TSizes.size8),
                      border: Border.all(color: TColors.borderPrimary),
                    ),
                    child: DropdownButton<String>(
                      hint: const Text('Select'),
                      isExpanded: true,
                      elevation: 0,
                      onChanged: (String? newValue) {},
                      underline: const SizedBox(height: 0.0),
                      dropdownColor: TColors.darkerGrey,
                      style: const TextStyle(
                        color: TColors.white,
                        fontWeight: FontWeight.w400,
                        fontSize: TSizes.fontSize12,
                      ),
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
                ],
              ),
            ),
          ],
        ));
  }
}
