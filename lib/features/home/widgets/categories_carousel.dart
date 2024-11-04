import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widgets/containers/rounded_icon_text.dart';
import '../../../common/widgets/shimmer/category_shimmer.dart';
import '../../../utils/utils.dart';
import '../../category/controllers/category.controllers.dart';

class TCategoriesCarousel extends StatelessWidget {
  const TCategoriesCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryControllers());

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
      child: SizedBox(
        height: TSizes.categoriesMaxHeight,
        child: Obx(() {
          if (controller.isLoading.value) return const TCategoryShimmer();

          return ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: controller.allCategories.length,
            itemBuilder: (_, index) {
              final item = controller.allCategories[index];
              return TRoundedIconText(
                label: item.label,
                icon: item.icon,
                size: TSizes.size30,
                onPressed: () {},
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
