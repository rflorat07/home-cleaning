import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../../top_service/screens/service_provider_details.dart';
import '../controllers/top_service_provider_carousel.controllers.dart';

class TTopServiceProviderCarousel extends StatelessWidget {
  const TTopServiceProviderCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TopServiceProviderCarouselControlller());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: SizedBox(
        height: TSizes.categoriesMaxHeight,
        child: Obx(() {
          if (controller.isLoading.value) return const TCategoryShimmer();

          return ListView.separated(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: controller.topServiceProvider.length,
            itemBuilder: (_, index) {
              final item = controller.topServiceProvider[index];
              return TopServiceProviderCard(
                label: item.name,
                imageUrl: item.imageUrl,
                onTap: () => Get.to(() => const ServiceProviderDetailsScreen()),
              );
            },
            separatorBuilder: (_, index) =>
                const SizedBox(width: TSizes.defaultSpace),
          );
        }),
      ),
    );
  }
}

class TopServiceProviderCard extends StatelessWidget {
  const TopServiceProviderCard({
    super.key,
    this.onTap,
    required this.label,
    required this.imageUrl,
  });

  final String label;
  final String imageUrl;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: onTap,
          child: TRoundedContainer(
            width: TSizes.iconXXL,
            height: TSizes.iconXXL,
            radius: TSizes.iconXXL,
            imageUrl: imageUrl,
            backgroundColor: TColors.lightSilver,
          ),
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
