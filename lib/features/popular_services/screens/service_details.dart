import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/service_details.controller.dart';
import '../widgets/service_details_appbar.dart';
import '../widgets/service_details_body.dart';
import '../widgets/service_details_book_container.dart';
import '../widgets/service_details_header.dart';
import '../widgets/service_details_tabs.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ServiceDetailsController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const ServiceDetailsAppBar(),
      bottomNavigationBar: const SafeArea(
        child: ServiceDetailsBookContainer(),
      ),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        physics: const ClampingScrollPhysics(),
        child: const DefaultTabController(
          length: 3,
          child: Column(
            children: [
              // Service Details Header
              ServiceDetailsHeader(),

              ServiceDetailsBody(),

              ServiceDetailsTabs(),
            ],
          ),
        ),
      ),
    );
  }
}
