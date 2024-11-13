import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../../provider/controllers/top_provider.controllers.dart';

class TTopServiceProviderCarousel extends StatelessWidget {
  const TTopServiceProviderCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TopProviderControlller());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: SizedBox(
        height: TSizes.categoriesMaxHeight,
        child: Obx(
          () {
            if (controller.isLoading.value) return const TCategoryShimmer();

            return ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: controller.topProviders.length,
              itemBuilder: (_, index) {
                return TopServiceProviderCard(
                  label: controller.topProviders[index].name,
                  imageUrl: controller.topProviders[index].thumbnail,
                  onTap: () => controller
                      .openProviderDetails(controller.topProviders[index]),
                );
              },
              separatorBuilder: (_, index) =>
                  const SizedBox(width: TSizes.defaultSpace),
            );
          },
        ),
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
            width: TSizes.size64,
            height: TSizes.size64,
            radius: TSizes.size64,
            imageUrl: imageUrl,
            backgroundColor: TColors.lightSilver,
          ),
        ),
        const SizedBox(height: TSizes.size2),
        Expanded(
          child: Container(
            width: TSizes.size64,
            margin: const EdgeInsets.symmetric(horizontal: TSizes.size4),
            child: Text(
              label,
              maxLines: 1,
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
        )
      ],
    );
  }
}
