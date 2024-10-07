import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:home_cleaning/common/widgets/appbar/appbar.dart';
import 'package:home_cleaning/common/widgets/containers/rounded_icon_text.dart';
import 'package:home_cleaning/features/category/controllers/category.controllers.dart';
import 'package:home_cleaning/utils/utils.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryControllers());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(TTexts.category,
            style: Theme.of(context).textTheme.titleMedium),
      ),
      body: GridView.count(
        mainAxisSpacing: TSizes.defaultSpace,
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        physics: const BouncingScrollPhysics(),
        crossAxisCount: 4,
        children: List.generate(controller.categories.length, (index) {
          final item = controller.categories[index];
          return TRoundedIconText(
            label: item.label,
            icon: item.icon,
            size: TSizes.iconLg,
            onPressed: () {},
          );
        }),
      ),
    );
  }
}
