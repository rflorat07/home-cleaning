import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../widgets/custom_available_date.dart';
import '../widgets/custom_dropdown_button.dart';
import '../widgets/custom_filter_chip_list.dart';
import '../widgets/custom_price_range.dart';
import '../widgets/custom_reviews_range.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: 'Filter'),
      bottomNavigationBar:
          TBottomNavigationContainer(onPressed: () {}, text: TTexts.apply),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Location
                  TCustomDropdownButton(),

                  /// Category
                  TCustomFilterChipList(),

                  /// Price Range
                  TCustomPriceRange(),

                  /// Reviews
                  TCustomReviewsRange(),

                  /// Available Date
                  TCustomAvailableDate(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
