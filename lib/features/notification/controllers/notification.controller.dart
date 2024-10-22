import 'package:get/get.dart';

import '../models/notification.model.dart';

class NotificationController extends GetxController {
  static NotificationController get instance => Get.find();

  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;

  @override
  void onInit() {
    fetchNotification();
    super.onInit();
  }

  Future<void> fetchNotification() async {
    notificationList.addAll(demoNotificationList);
  }
}
