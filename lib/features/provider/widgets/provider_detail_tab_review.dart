import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import 'provider_add_review_header.dart';
import 'provider_review.dart';

class ProviderDetailTabReview extends StatelessWidget {
  const ProviderDetailTabReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //  Gallery Heading
          TSectionHeading(
            title: TTexts.reviewTab,
            textStyle: textTheme.bodyLarge,
            buttonTitle: TTexts.addReview,
            icon: const Icon(
              IconsaxPlusLinear.edit_2,
              size: TSizes.size18,
              color: TColors.green,
            ),
            onPressed: () => _reviewServiceModal(context),
            textButtonStyle: textTheme.bodyLarge!.apply(color: TColors.green),
          ),

          const SizedBox(height: TSizes.spaceBtwItems),

          // Search in reviews
          TRoundedContainer(
            showBorder: true,
            radius: TSizes.size12,
            height: TSizes.size40,
            padding: const EdgeInsets.symmetric(horizontal: TSizes.size12),
            child: Row(
              children: [
                const Icon(
                  IconsaxPlusLinear.search_normal_1,
                  color: TColors.green,
                ),
                const SizedBox(width: TSizes.size12),
                Text(
                  TTexts.searchReviews,
                  style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
                )
              ],
            ),
          ),

          // Reviews
          const ProviderReview(),
        ],
      ),
    );
  }

  _reviewServiceModal(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      useSafeArea: true,
      enableDrag: false,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              children: [
                const ProviderAddReviewHeader(),

                // Star Range
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      const Divider(),
                      const SizedBox(height: TSizes.defaultSpace),
                      const Text(TTexts.yourOverallRating),
                      const SizedBox(height: TSizes.size15),
                      // Star Range
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ...List.generate(
                            5,
                            (index) => const Row(
                              children: [
                                Icon(AppIcons.star,
                                    color: TColors.starYellow,
                                    size: TSizes.size40),
                                SizedBox(width: TSizes.size18),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.defaultSpace),
                      const Divider(),
                    ],
                  ),
                ),

                // Add detailed review
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextFormField(
                        labelText: TTexts.addDetailedReview,
                        placeholder: TTexts.enterHere,
                        maxLines: 3,
                        borderRadius: TSizes.size12,
                        backgroundColor: Colors.white,
                        border: Border.all(color: TColors.borderPrimary),
                      ),

                      //  CTA Add photo
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          IconsaxPlusLinear.camera,
                          size: TSizes.size18,
                          color: TColors.green,
                        ),
                        label: Text(
                          TTexts.addPphoto,
                          style:
                              Theme.of(context).textTheme.labelLarge!.copyWith(
                                    color: TColors.green,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Bottom Navigation
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: TBottomNavigationContainer(
                    text: TTexts.submit,
                    onPressed: () => Get.back(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
