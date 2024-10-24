import 'package:get/get.dart';

import '../models/booking.model.dart';

class MyBookingsController extends GetxController {
  static MyBookingsController get instance => Get.find();

  RxList<BookingModel> bookingList = <BookingModel>[].obs;

  @override
  void onInit() {
    fetchMyBookings();
    super.onInit();
  }

  Future<void> fetchMyBookings() async {
    bookingList.assignAll(domoBookingModel);
  }
}
