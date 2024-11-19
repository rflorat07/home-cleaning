import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/widgets/containers/rounded_container.dart';
import '../../../common/widgets/icons/t_circular_icon.dart';
import '../../../common/widgets/texts/section_heading.dart';
import '../../../utils/utils.dart';
import '../controllers/service_details.controller.dart';

class ServiceDetailTabAbout extends StatelessWidget {
  const ServiceDetailTabAbout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controller = ServiceDetailsController.instance;
    return Container(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //  Heading - About Service
            TSectionHeading(
              title: TTexts.aboutService,
              textStyle: textTheme.bodyLarge,
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.size8),

            //  Section - About Service Desc
            Text(
              TTexts.aboutServiceDesc,
              style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
            ),
            const SizedBox(height: TSizes.defaultSpace),

            //  Heading -  Service Provider
            TSectionHeading(
              title: TTexts.serviceProvider,
              textStyle: textTheme.bodyLarge,
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.size8),

            //  Section - Service Provider
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // Circle Avatar
                    CircleAvatar(
                        radius: TSizes.size24,
                        backgroundImage: controller.isLoading.value
                            ? null
                            : CachedNetworkImageProvider(
                                controller.serviceSelected.value.thumbnail,
                              ),
                        backgroundColor: TColors.lightSilver),
                    const SizedBox(width: TSizes.size12),

                    // Name
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(controller.serviceSelected.value.name,
                            style: textTheme.bodyLarge!
                                .copyWith(fontWeight: FontWeight.w600)),
                        // Service Provider
                        Text(
                          TTexts.serviceProvider,
                          style: textTheme.labelLarge!
                              .apply(color: TColors.darkerGrey),
                        ),
                      ],
                    )
                  ],
                ),

                // Circular Icon
                const Row(
                  children: [
                    TCircularIcon(
                        icon: IconsaxPlusBold.message,
                        iconColor: TColors.green,
                        backgroundColor: TColors.whiteSmoke),
                    SizedBox(width: TSizes.spaceBtwItems),
                    TCircularIcon(
                        icon: IconsaxPlusBold.call,
                        iconColor: TColors.green,
                        backgroundColor: TColors.whiteSmoke),
                  ],
                )
              ],
            ),

            const SizedBox(height: TSizes.defaultSpace),

            //  Heading - - Working Hours
            TSectionHeading(
              title: TTexts.workingHours,
              textStyle: textTheme.bodyLarge,
              showActionButton: false,
            ),
            const SizedBox(height: TSizes.size4),
            const Divider(color: TColors.dividerColor),
            const SizedBox(height: TSizes.size12),

            //Section - Working Hours
            Column(
              children: [
                ...List.generate(
                    controller.serviceSelected.value.workingHours.length,
                    (index) => Container(
                          padding: const EdgeInsets.only(bottom: TSizes.size12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.serviceSelected.value
                                    .workingHours[index].label,
                                style: textTheme.bodyMedium!
                                    .apply(color: TColors.darkerGrey),
                              ),
                              Text(
                                controller.serviceSelected.value
                                    .workingHours[index].hours,
                              )
                            ],
                          ),
                        ))
              ],
            ),
            const SizedBox(height: TSizes.size12),

            // Heading - Address
            TSectionHeading(
              title: TTexts.address,
              textStyle: textTheme.bodyLarge,
              buttonTitle: TTexts.viewOnMap,
              textButtonStyle: textTheme.bodyLarge!.apply(color: TColors.green),
              onPressed: () =>
                  controller.mapLauncher(controller.serviceSelected.value.geo),
            ),

            const SizedBox(height: TSizes.size4),
            const Divider(color: TColors.dividerColor),
            const SizedBox(height: TSizes.size4),

            /// Address Desc
            Row(
              children: [
                const Icon(IconsaxPlusLinear.location, size: TSizes.size18),
                const SizedBox(width: TSizes.size4),
                Text(
                  controller.serviceSelected.value.address,
                  style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
                )
              ],
            ),

            // Map
            const SizedBox(height: TSizes.size12),
            const TRoundedContainer(
              radius: TSizes.size12,
              width: double.infinity,
              height: TSizes.size200,
              isNetworkImage: false,
              imageUrl: TImages.serviceMap,
            ),
          ],
        ),
      ),
    );
  }
}
