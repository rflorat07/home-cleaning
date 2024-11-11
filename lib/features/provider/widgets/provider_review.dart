import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/provider_details.controller.dart';

class ProviderReview extends StatelessWidget {
  const ProviderReview({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = ProviderDetailsController.instance;
    return Obx(
      () => Column(
        children: [
          ...List.generate(
            controller.providerDetails.value.reviews.length,
            (index) => Container(
              margin:
                  const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar - Name - Months
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar - Name
                      Row(
                        children: [
                          // Avatar
                          CircleAvatar(
                            radius: TSizes.size18,
                            backgroundImage: CachedNetworkImageProvider(
                              controller
                                  .providerDetails.value.reviews[index].avatar,
                            ),
                            backgroundColor: TColors.lightSilver,
                          ),
                          const SizedBox(width: TSizes.size8),

                          // Name
                          Text(
                              controller.providerDetails.value.reviews[index]
                                  .reviewerName,
                              style: textTheme.bodyLarge),
                        ],
                      ),
                      // Months
                      Text(
                        controller.providerDetails.value.reviews[index]
                            .getFormattedDate(),
                        style: textTheme.labelLarge!
                            .apply(color: TColors.darkerGrey),
                      )
                    ],
                  ),

                  const SizedBox(height: TSizes.size12),
                  // Text
                  Text(
                    controller.providerDetails.value.reviews[index].comment,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style:
                        textTheme.labelLarge!.apply(color: TColors.darkerGrey),
                  ),

                  const SizedBox(height: TSizes.size8),

                  // star
                  Wrap(
                    spacing: 3,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      ...List.generate(
                        5,
                        (index) => const Icon(
                          Icons.star,
                          size: TSizes.size18,
                          color: TColors.starYellow,
                        ),
                      ),
                      Text(
                        controller.providerDetails.value.reviews[index].rating
                            .toString(),
                        style: textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: TSizes.size12),

                  // Gallery IMG
                  /* SizedBox(
                    height: ((MediaQuery.of(context).size.width - 48) / 2) * 2,
                    child: GridView.count(
                      primary: false,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.all(0.0),
                      crossAxisSpacing: TSizes.size8,
                      mainAxisSpacing: TSizes.size8,
                      crossAxisCount: 2,
                      children: [
                        ...List.generate(
                          4,
                          (_) => const TRoundedContainer(
                            radius: TSizes.size12,
                            backgroundColor: TColors.lightSilver,
                          ),
                        )
                      ],
                    ),
                  ) */
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
