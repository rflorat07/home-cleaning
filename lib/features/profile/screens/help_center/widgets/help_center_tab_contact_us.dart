import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../common/common.dart';
import '../../../../../utils/utils.dart';
import '../controllers/help_center.controller.dart';

class HelpCenterTabContactUs extends StatelessWidget {
  const HelpCenterTabContactUs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = HelpCenterController.instance;
    return SingleChildScrollView(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Obx(
        () => controller.isLoading.value
            ? const CenterCircularProgressIndicator()
            : Column(
                children: [
                  ...List.generate(
                    controller.contactUsList.length,
                    (index) => CustomExpansionTile(
                      title: controller.contactUsList[index].title,
                      content: controller.contactUsList[index].content,
                      isExpanded: controller.contactUsList[index].expanded,
                      leading: Icon(
                        size: TSizes.size24,
                        AppIcons.getIconDataFromName(controller
                                .contactUsList[index].icon
                                ?.toLowerCase() ??
                            ''),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
