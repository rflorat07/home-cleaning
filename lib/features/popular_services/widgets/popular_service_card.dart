import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/models/popular_service.model.dart';
import '../../../common/widgets/containers/rounded_container.dart';
import '../../../utils/utils.dart';
import '../controllers/service_details.controller.dart';

class TPopularServiceCard extends StatelessWidget {
  const TPopularServiceCard({
    super.key,
    this.padding,
    required this.item,
    this.showBorder = true,
    this.showIconButton = true,
  });

  final PopularServiceModel item;
  final EdgeInsetsGeometry? padding;
  final bool showBorder, showIconButton;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final controllerServiceDetails = ServiceDetailsController.instance;
    return TRoundedContainer(
      height: TSizes.size135,
      radius: TSizes.borderRadiusLg,
      backgroundColor: TColors.white,
      showBorder: showBorder,
      padding: padding ?? const EdgeInsets.all(TSizes.size10),
      child: InkWell(
        onTap: () => controllerServiceDetails.serviceDetails = item,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Container
            TRoundedContainer(
              width: 110,
              imageUrl: item.imageUrl,
              radius: TSizes.borderRadiusLg,
              backgroundColor: TColors.lightSilver,
              padding: const EdgeInsets.all(TSizes.defaultSpace / 2),
            ),

            const SizedBox(width: TSizes.defaultSpace / 2),

            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Service
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // Offer
                        TRoundedContainer(
                          radius: TSizes.borderRadiusLg / 2,
                          backgroundColor: TColors.whiteSmoke,
                          padding: const EdgeInsets.symmetric(
                              vertical: TSizes.xs, horizontal: TSizes.sm),
                          child: Text(
                            item.offer,
                            overflow: TextOverflow.ellipsis,
                            style: textTheme.labelSmall!.copyWith(
                                color: TColors.green,
                                fontWeight: FontWeight.w400),
                          ),
                        ),

                        const SizedBox(height: TSizes.xs),

                        // Title
                        Text(
                          item.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: textTheme.bodyLarge!.copyWith(fontSize: 15),
                        ),

                        const SizedBox(height: TSizes.xs),

                        // Icon - Name
                        Row(
                          children: [
                            // Icon Profile
                            const Icon(IconsaxPlusBold.profile,
                                color: TColors.green, size: 20),

                            const SizedBox(width: TSizes.xs / 2),

                            // Profile name
                            Text(
                              item.name,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: textTheme.labelLarge!
                                  .apply(color: TColors.darkerGrey),
                            )
                          ],
                        ),

                        const SizedBox(height: TSizes.xs),

                        // Cost
                        Text(
                          item.money,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style:
                              textTheme.bodyLarge!.apply(color: TColors.green),
                        )
                      ],
                    ),
                  ),

                  // Bookmark Button
                  if (showIconButton)
                    IconButton(
                      onPressed: () => _showBottomSheet(context, item),
                      icon: const Icon(AppIcons.bookmark, color: TColors.green),
                      iconSize: TSizes.iconMd,
                    )
                  // Title - Icon - Name - Cost
                ],
              ),
            )

            // Title
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, PopularServiceModel item) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        final textTheme = Theme.of(context).textTheme;
        return SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.size16,
              ),
              width: double.infinity,
              child: Column(
                children: [
                  // Remove Favorites text
                  Text(
                    TTexts.removeFavorites,
                    style: textTheme.headlineSmall!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  // Divider
                  const SizedBox(height: TSizes.spaceBtwItems),
                  const Divider(),
                  const SizedBox(height: TSizes.size6),

                  // Popular Service Card
                  TPopularServiceCard(
                    item: item,
                    showBorder: false,
                    showIconButton: false,
                    padding:
                        const EdgeInsets.symmetric(vertical: TSizes.size10),
                  ),

                  // Button - Cancel - Remove
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FilledButton(
                          onPressed: Get.back,
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(TColors.whiteSmoke),
                          ),
                          child: const Text(
                            TTexts.cancel,
                            style: TextStyle(color: TColors.green),
                          ),
                        ),
                      ),
                      const SizedBox(width: TSizes.size10),
                      Expanded(
                        child: FilledButton(
                          onPressed: Get.back,
                          child: const Text(TTexts.yesRemove),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
