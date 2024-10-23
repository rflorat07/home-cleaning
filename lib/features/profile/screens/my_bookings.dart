import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../enums/booking_type.enum.dart';
import '../widgets/booking_list.dart';

class MyBookingsScreen extends StatelessWidget {
  const MyBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: TAppBar(
          showBackArrow: true,
          title: TTexts.myBookings,
          bottom: TabBar(tabs: [
            Tab(child: Text(TTexts.upcomingTab)),
            Tab(child: Text(TTexts.completedTab)),
            Tab(child: Text(TTexts.cancelledTab)),
          ]),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace, vertical: TSizes.spaceBtwItems),
          child: TabBarView(
            children: [
              TBookingList(type: BookingType.upcoming, items: []),
              TBookingList(type: BookingType.completed, items: []),
              TBookingList(type: BookingType.cancelled, items: []),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingsList {}
