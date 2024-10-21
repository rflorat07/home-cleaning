import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../../popular_services/widgets/popular_service_card.dart';
import '../controllers/search.controller.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TSearchController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: TextField(
          controller: controller.searchTextController,
          onChanged: (value) => controller.updateSearchTerm(value),
          decoration: InputDecoration(
            labelText: TTexts.search,
            prefixIcon: const Icon(
              IconsaxPlusLinear.search_normal_1,
              color: TColors.green,
            ),
            suffixIcon: Obx(
              () => controller.searchTerm.value.isNotEmpty
                  ? IconButton(
                      icon: const Icon(IconsaxPlusLinear.close_circle,
                          color: TColors.green),
                      onPressed: () => controller.resetTextField(),
                    )
                  : const SizedBox(),
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.spaceBtwItems),
            child: Obx(
              () => Text(
                '${controller.filteredItems.length} Results Found',
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.separated(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(
                    horizontal: TSizes.defaultSpace, vertical: TSizes.size4),
                itemCount: controller.filteredItems.length,
                itemBuilder: (context, index) {
                  return TPopularServiceCard(
                      item: controller.filteredItems[index]);
                },
                separatorBuilder: (context, index) =>
                    const SizedBox(height: TSizes.spaceBtwItems),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
