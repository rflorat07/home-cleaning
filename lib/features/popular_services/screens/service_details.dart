import 'package:flutter/material.dart';
import 'package:home_cleaning/features/popular_services/widgets/service_details_header.dart';

import '../widgets/service_details_appbar.dart';
import '../widgets/service_details_body.dart';
import '../widgets/service_details_tabs.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ServiceDetailsAppBar(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: DefaultTabController(
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
