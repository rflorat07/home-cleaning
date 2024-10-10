import 'package:flutter/material.dart';
import 'package:home_cleaning/features/explore/widgets/explorer_carousel_card.dart';

import '../../../utils/utils.dart';
import '../widgets/explore_header_container.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(TImages.exploreMap),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TExploreHeaderContainer(),
            ExplorerCarouselCard(),
          ],
        ) /* add child content here */,
      ),
    );
  }
}
