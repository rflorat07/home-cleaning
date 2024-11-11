import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/provider_details.controller.dart';

class ProviderDetailsBody extends StatelessWidget {
  const ProviderDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(ProviderDetailsController());
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Obx(
        () => Column(
          children: [
            Row(
              children: [
                // Avatar
                Stack(
                  children: [
                    CircleAvatar(
                      radius: TSizes.size48,
                      backgroundImage: controller.isLoading.value
                          ? null
                          : CachedNetworkImageProvider(
                              controller.providerDetails.value.thumbnail,
                            ),
                      backgroundColor: TColors.lightSilver,
                    ),
                    const Positioned(
                      bottom: 0,
                      right: 0,
                      child: Icon(
                        AppIcons.verify,
                        color: TColors.green,
                        size: TSizes.size25,
                      ),
                    )
                  ],
                ),
                const SizedBox(width: TSizes.size16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name
                      Text(
                        controller.providerDetails.value.name,
                        style: textTheme.headlineSmall,
                      ),
                      const SizedBox(height: TSizes.size4),

                      // Category
                      Text(
                        controller.providerDetails.value.category,
                        style: textTheme.bodyMedium!
                            .apply(color: TColors.darkerGrey),
                      ),
                      const SizedBox(height: TSizes.size4),

                      // Address
                      Row(
                        children: [
                          const Icon(IconsaxPlusBold.location,
                              size: TSizes.size16, color: TColors.green),
                          const SizedBox(width: TSizes.size2),
                          Expanded(
                            child: Text(
                                controller.providerDetails.value.address,
                                overflow: TextOverflow.ellipsis,
                                style: textTheme.bodyMedium!
                                    .apply(color: TColors.darkerGrey)),
                          ),
                          const SizedBox(width: TSizes.size2),
                          const Icon(IconsaxPlusBold.map_1,
                              size: TSizes.size19, color: TColors.green),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.defaultSpace),
            const Divider(),
            const SizedBox(height: TSizes.defaultSpace),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TRoundedIconText(
                  label:
                      '${controller.providerDetails.value.customer.toString()}+',
                  icon: IconsaxPlusBold.profile_2user,
                  width: TSizes.size60,
                  height: TSizes.size60,
                  onPressed: () {},
                  style: textTheme.titleLarge!.apply(color: TColors.green),
                  child: Text(
                    TTexts.aboutService,
                    style:
                        textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                  ),
                ),
                TRoundedIconText(
                  label: '${controller.providerDetails.value.yearsExp}+',
                  icon: IconsaxPlusBold.briefcase,
                  width: TSizes.size60,
                  height: TSizes.size60,
                  onPressed: () {},
                  style: textTheme.titleLarge!.apply(color: TColors.green),
                  child: Text(
                    TTexts.yearsExp,
                    style:
                        textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                  ),
                ),
                TRoundedIconText(
                  label: '${controller.providerDetails.value.rating}+',
                  icon: IconsaxPlusBold.star_1,
                  width: TSizes.size60,
                  height: TSizes.size60,
                  onPressed: () {},
                  style: textTheme.titleLarge!.apply(color: TColors.green),
                  child: Text(
                    TTexts.rating,
                    style:
                        textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                  ),
                ),
                TRoundedIconText(
                  label: '${controller.providerDetails.value.reviews.length}+',
                  icon: IconsaxPlusBold.message,
                  width: TSizes.size60,
                  height: TSizes.size60,
                  onPressed: () {},
                  style: textTheme.titleLarge!.apply(color: TColors.green),
                  child: Text(
                    TTexts.review,
                    style:
                        textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
