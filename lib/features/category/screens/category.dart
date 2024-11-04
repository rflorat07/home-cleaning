import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/category.controllers.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CategoryControllers.instance;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: TTexts.category,
      ),
      body: Obx(
        () => GridView.count(
          mainAxisSpacing: TSizes.defaultSpace,
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          physics: const BouncingScrollPhysics(),
          crossAxisCount: 4,
          children: List.generate(controller.allCategories.length, (index) {
            final item = controller.allCategories[index];
            return TRoundedIconText(
              label: item.label,
              icon: item.icon,
              size: TSizes.iconLg,
              onPressed: () {},
            );
          }),
        ),
      ),
    );
  }
}
