import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../common/controllers/map.controller.dart';
import '../../../utils/utils.dart';
import '../widgets/explore_header_container.dart';
import '../widgets/explorer_carousel_card.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
      ),
      body: Stack(
        children: [
          Obx(
            () => GoogleMap(
              scrollGesturesEnabled: true,
              style: controller.loadMapStyle,
              myLocationButtonEnabled: false,
              onMapCreated: controller.setMapController,
              markers: Set<Marker>.of(controller.markers),
              initialCameraPosition: controller.initialCameraPosition(),
              padding: const EdgeInsets.only(bottom: 24, left: 24),
            ),
          ),
          const Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: TExploreHeaderContainer(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: TSizes.defaultSpace,
                      bottom: TSizes.defaultSpace / 2),
                  child: TCircularIcon(
                    width: TSizes.size40,
                    height: TSizes.size40,
                    icon: IconsaxPlusBold.gps,
                    onPressed: () =>
                        controller.moveToPosition(controller.initialPosition),
                    showBorder: true,
                    borderWidth: 0.5,
                    iconColor: TColors.green,
                    backgroundColor: Colors.white,
                  ),
                ),
                const ExplorerCarouselCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
