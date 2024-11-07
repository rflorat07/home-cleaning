import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/containers/rounded_container.dart';
import '../../../utils/utils.dart';
import '../controllers/service_details.controller.dart';

class ServiceDetailsBody extends StatelessWidget {
  const ServiceDetailsBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = ServiceDetailsController.instance;
    return Padding(
      padding: const EdgeInsets.only(
          top: TSizes.defaultSpace,
          bottom: TSizes.defaultSpace / 2,
          left: TSizes.defaultSpace,
          right: TSizes.defaultSpace),
      child: Obx(
        () => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Service - Reviews
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Service
                TRoundedContainer(
                  radius: TSizes.size6,
                  backgroundColor: TColors.whiteSmoke,
                  padding: const EdgeInsets.symmetric(
                      vertical: TSizes.size4, horizontal: TSizes.size8),
                  child: Text(
                    controller.serviceSelected.value.offer,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .apply(color: TColors.green),
                  ),
                ),

                // Reviews
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: TColors.starYellow,
                      size: TSizes.size18,
                    ),
                    const SizedBox(width: TSizes.size4),
                    Text(
                      '${controller.serviceSelected.value.rating} (365 reviews)',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .apply(color: TColors.darkerGrey),
                    )
                  ],
                ),
                //
              ],
            ),

            const SizedBox(height: TSizes.spaceBtwItems),

            Text(
              controller.serviceSelected.value.title,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: TSizes.fontSize22),
            ),

            const SizedBox(height: TSizes.size12),

            Text(
              controller.serviceSelected.value.address,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .apply(color: TColors.darkerGrey),
            ),
          ],
        ),
      ),
    );
  }
}
