import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../../popular_services/widgets/popular_service_card.dart';
import '../controllers/bookmark.controllers.dart';

class ListViewBookmarkCard extends StatelessWidget {
  const ListViewBookmarkCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BookmarkControllers());

    return Expanded(
      child: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.only(
              left: TSizes.defaultSpace,
              right: TSizes.defaultSpace,
              bottom: TSizes.defaultSpace),
          physics: const BouncingScrollPhysics(),
          itemCount: controller.bookmarkList.length,
          itemBuilder: (context, index) {
            return TPopularServiceCard(
              item: controller.bookmarkList[index],
              onPressed: () {
                Get.back();
                controller.removeFromFavorites(controller.bookmarkList[index]);
              },
            );
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: TSizes.spaceBtwItems),
        ),
      ),
    );
  }
}
