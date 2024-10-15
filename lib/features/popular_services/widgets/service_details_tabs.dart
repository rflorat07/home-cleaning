import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

import 'service_detail_tab_gallery.dart';
import 'service_details_tab_about.dart';

class ServiceDetailsTabs extends StatelessWidget {
  const ServiceDetailsTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // TAB BAR //
        const TabBar(
            indicatorPadding:
                EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
            tabs: [
              Tab(child: Text(TTexts.aboutTab)),
              Tab(child: Text(TTexts.galleryTab)),
              Tab(child: Text(TTexts.reviewTab)),
            ]),

        // TAB BAR VIEWS //
        SizedBox(
          height: MediaQuery.of(context).size.height,
          child: const TabBarView(
            children: [
              ServiceDetailTabAbout(),
              ServiceDetailTabGallery(),
              ServiceDetailTabAbout(),
            ],
          ),
        )
      ],
    );
  }
}
