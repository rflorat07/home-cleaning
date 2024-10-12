import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/common/widgets/containers/rounded_container.dart';

import '../../../utils/utils.dart';
import '../controllers/top_service_provider_carousel.controllers.dart';

class TTopServiceProviderCarousel extends StatelessWidget {
  const TTopServiceProviderCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TopServiceProviderCarouselControlller());

    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: SizedBox(
            height: TSizes.categoriesMaxHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.topServiceProvider.length,
              itemBuilder: (_, index) {
                final item = controller.topServiceProvider[index];
                return TopServiceProviderCard(
                  label: item.name,
                  imageUrl: item.imageUrl,
                );
              },
              separatorBuilder: (_, index) =>
                  const SizedBox(width: TSizes.defaultSpace),
            ),
          ),
        ));
  }
}

class TopServiceProviderCard extends StatelessWidget {
  const TopServiceProviderCard({
    super.key,
    required this.label,
    required this.imageUrl,
  });

  final String label;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const TRoundedContainer(
          width: TSizes.iconXXL,
          height: TSizes.iconXXL,
          radius: TSizes.iconXXL,
          //imageUrl: imageUrl,
          backgroundColor: TColors.lightSilver,
        ),
        const SizedBox(height: TSizes.xs),
        Text(
          label,
          maxLines: 1,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .labelLarge!
              .copyWith(fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
