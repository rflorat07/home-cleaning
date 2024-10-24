import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../enums/booking_type.enum.dart';
import '../models/booking.model.dart';
import 'bookin_expansion_content.dart';
import 'booking_item_header.dart';

class TBookingList extends StatelessWidget {
  const TBookingList({
    super.key,
    required this.type,
    required this.items,
  });

  final BookingType type;
  final List<BookingModel> items;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        children: [
          ...List.generate(
            items.length,
            (index) => TRoundedContainer(
              width: double.infinity,
              radius: TSizes.borderRadiusLg,
              backgroundColor: TColors.white,
              showBorder: true,
              padding: const EdgeInsets.all(TSizes.size12),
              margin: const EdgeInsets.only(bottom: TSizes.size12),
              child: Column(
                children: [
                  BookingItemHeader(item: items[index]),
                  const SizedBox(height: TSizes.size12),
                  const Divider(),
                  const SizedBox(height: TSizes.size12),
                  const BookinExpansionContent(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
