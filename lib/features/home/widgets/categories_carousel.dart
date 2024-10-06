import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/common/widgets/containers/rounded_container.dart';

import '../../../utils/utils.dart';
import '../controllers/category_carousel.controllers.dart';

class TCategoriesCarousel extends StatelessWidget {
  const TCategoriesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryCarouselControlller());

    return Obx(() => Padding(
          padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
          child: SizedBox(
            height: TSizes.categoriesMaxHeight,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: controller.categories.length,
              itemBuilder: (_, index) {
                final item = controller.categories[index];
                return UncontainedLayoutCategory(
                  label: item.label,
                  icon: item.icon,
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
    required this.icon,
  });

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TRoundedContainer(
          width: TSizes.iconXL,
          height: TSizes.iconXL,
          radius: TSizes.iconXL,
          backgroundColor: TColors.whiteSmoke,
          child: Icon(
            icon,
            color: TColors.green,
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
