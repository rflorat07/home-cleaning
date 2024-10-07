import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/containers/rounded_icon_text.dart';
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
                return TRoundedIconText(
                  label: item.label,
                  icon: item.icon,
                  size: TSizes.iconLg,
                  onPressed: () {},
                );
              },
              separatorBuilder: (_, index) =>
                  const SizedBox(width: TSizes.defaultSpace),
            ),
          ),
        ));
  }
}
