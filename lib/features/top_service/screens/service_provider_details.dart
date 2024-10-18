import 'package:flutter/material.dart';

import '../widgets/service_provider_details_appbar.dart';
import '../widgets/service_provider_details_body.dart';
import '../widgets/service_provider_details_tab.dart';

class ServiceProviderDetailsScreen extends StatelessWidget {
  const ServiceProviderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ServiceProviderDetailsAppBar(),
      body: SingleChildScrollView(
        // controller: controller.scrollController,
        physics: ClampingScrollPhysics(),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              ServiceProviderDetailsBody(),
              ServiceProviderDetailsTabs()
            ],
          ),
        ),
      ),
    );
  }
}
