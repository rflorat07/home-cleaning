import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../../popular_services/widgets/popular_service_card.dart';
import '../controllers/bookmark.controllers.dart';

class ListViewBookmarkCard extends StatelessWidget {
  const ListViewBookmarkCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = BookmarkControllers.instance;

    return Expanded(
      child: Obx(
        () {
          if (controller.isLoading.value) {
            return ListView.separated(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace,
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              itemCount: 5,
              itemBuilder: (context, index) {
                return const TPopularServiceShimmerCard();
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: TSizes.spaceBtwItems),
            );
          }

          return RefreshIndicator(
            color: TColors.green,
            backgroundColor: Colors.white,
            onRefresh: () => controller.fetchBookmarkList(),
            child: ListView.separated(
              padding: const EdgeInsets.only(
                  left: TSizes.defaultSpace,
                  right: TSizes.defaultSpace,
                  bottom: TSizes.defaultSpace),
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: controller.allBookmark.length,
              itemBuilder: (context, index) {
                return TPopularServiceCard(
                  item: controller.allBookmark[index],
                  onPressed: () {
                    Get.back();
                    controller
                        .removeFromFavorites(controller.allBookmark[index]);
                  },
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: TSizes.spaceBtwItems),
            ),
          );
        },
      ),
    );
  }
}
