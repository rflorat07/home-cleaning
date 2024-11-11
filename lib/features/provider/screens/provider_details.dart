import 'package:flutter/material.dart';

import '../widgets/provider_details_body.dart';
import '../widgets/provider_details_tab.dart';
import '../widgets/service_provider_details_appbar.dart';

class ProviderDetailsScreen extends StatelessWidget {
  const ProviderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: ServiceProviderDetailsAppBar(),
      body: SingleChildScrollView(
        physics: ClampingScrollPhysics(),
        child: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              ProviderDetailsBody(),
              ProviderDetailsTabs(),
            ],
          ),
        ),
      ),
    );
  }
}
