import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/my_bookings.controller.dart';
import '../enums/booking_type.enum.dart';
import '../widgets/booking_list.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MyBookingsController());
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: const TAppBar(
          showBackArrow: true,
          title: TTexts.myBookings,
          bottom: TabBar(tabs: [
            Tab(child: Text(TTexts.upcomingTab)),
            Tab(child: Text(TTexts.completedTab)),
            Tab(child: Text(TTexts.cancelledTab)),
          ]),
        ),
        body: TabBarView(
          children: [
            TBookingList(
              type: BookingType.upcoming,
              items: controller.bookingList
                  .where((item) => item.type == BookingType.upcoming)
                  .toList(),
            ),
            TBookingList(
              type: BookingType.completed,
              items: controller.bookingList
                  .where((item) => item.type == BookingType.completed)
                  .toList(),
            ),
            TBookingList(
              type: BookingType.cancelled,
              items: controller.bookingList
                  .where((item) => item.type == BookingType.cancelled)
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingsList {}
