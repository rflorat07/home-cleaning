import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../../../utils/utils.dart';

class HelpCenterTabFaq extends StatelessWidget {
  const HelpCenterTabFaq({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const titleList = [
      'What if I need to cancel  a booking?',
      'How do I receive Booking Details?',
      'How Filter Work?',
      'How can I edit my profile information?',
      'Is Voice call or Chat Feature there?',
      'How Bookmark Work?',
      'Do I need to be home during the service?',
      'How Explore Work?',
    ];
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: TSizes.defaultSpace),
      child: Column(
        children: [
          // Filter FAQ
          const CustomFilterChips(
            chips: [
              'All',
              'Services',
              'General',
              'Account',
              'Booking',
              'Profile'
            ],
          ),

          // FAQ
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace, vertical: TSizes.size12),
            child: Column(
              children: [
                ...List.generate(
                  titleList.length,
                  (index) => CustomExpansionTile(
                    title: titleList[index],
                    isExpanded: index == 0,
                    content:
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
