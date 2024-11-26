import 'package:flutter/material.dart';

import '../../../../../common/common.dart';
import '../../../../../utils/utils.dart';
import '../widgets/help_center_search.dart';
import '../widgets/help_center_tab_contact_us.dart';
import '../widgets/help_center_tab_faq.dart';

class HelpCenterScreen extends StatelessWidget {
  const HelpCenterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: TAppBar(showBackArrow: true, title: TTexts.helpCenter),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            // Search
            HelpCenterSearch(),

            // Tabs
            TabBar(
              tabs: [
                Tab(child: Text(TTexts.faq)),
                Tab(child: Text(TTexts.contactUs)),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  HelpCenterTabFaq(),
                  HelpCenterTabContactUs(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
