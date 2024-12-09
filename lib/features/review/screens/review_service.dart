import 'package:flutter/material.dart';

import '../../popular_services/widgets/service_details_body.dart';

class ReviewServiceScreen extends StatelessWidget {
  const ReviewServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          ServiceDetailsBody(),
        ],
      ),
    );
  }
}
