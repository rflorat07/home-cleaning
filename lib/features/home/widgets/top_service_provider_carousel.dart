import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/common/widgets/containers/rounded_container.dart';

import '../../../utils/utils.dart';
import '../controllers/top_service_provider_carousel.controllers.dart';

class TTopServiceProviderCarousel extends StatelessWidget {
  const TTopServiceProviderCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TTopServiceProviderCarouselControlller());

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
                return UncontainedLayoutCategory(
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

class UncontainedLayoutCategory extends StatelessWidget {
  const UncontainedLayoutCategory({
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
          width: TSizes.iconXL,
          height: TSizes.iconXL,
          radius: TSizes.iconXL,
          //imageUrl: imageUrl,
          backgroundColor: TColors.whiteSmoke,
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
