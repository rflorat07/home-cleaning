import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';
import '../controllers/notification.controller.dart';
import '../widgets/notification_appbar.dart';
import '../widgets/notification_list_tile.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NotificationController());
    return Scaffold(
      appBar: const NotificationAppbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...List.generate(
              controller.notificationList.length,
              (index) => NotificationListTile(
                notification: controller.notificationList[index],
              ),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
