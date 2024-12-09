import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/provider_details.controller.dart';

class ProviderAddReviewHeader extends StatelessWidget {
  const ProviderAddReviewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = Get.put(ProviderDetailsController());
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: TSizes.size76,
            child: Stack(clipBehavior: Clip.none, children: [
              Positioned(
                top: -40,
                right: 0,
                left: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Avatar
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 4),
                          ),
                          child: CircleAvatar(
                            radius: TSizes.size50,
                            backgroundImage: controller.isLoading.value
                                ? null
                                : CachedNetworkImageProvider(
                                    controller.providerDetails.value.thumbnail,
                                  ),
                            backgroundColor: TColors.lightSilver,
                          ),
                        ),
                        const Positioned(
                          bottom: 0,
                          right: 5,
                          child: Icon(
                            AppIcons.verify,
                            color: TColors.green,
                            size: TSizes.size25,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ]),
          ),

          Text(
            controller.providerDetails.value.name,
            style: textTheme.headlineSmall!.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: TSizes.size6),

          // Category
          Text(
            controller.providerDetails.value.category,
            style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            child: Text(
              textAlign: TextAlign.center,
              '${TTexts.yourExperience} ${controller.providerDetails.value.name} ${controller.providerDetails.value.category} ?',
              style:
                  textTheme.titleMedium!.copyWith(fontSize: TSizes.fontSize20),
            ),
          ),

          const SizedBox(height: TSizes.defaultSpace),
        ],
      ),
    );
  }
}
