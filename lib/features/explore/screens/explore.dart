import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common/controllers/map.controller.dart';
import '../../../utils/utils.dart';
import '../widgets/explore_header_container.dart';
import '../widgets/explorer_carousel_card.dart';
import '../widgets/explorer_location_button.dart';

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
            () => Stack(
              children: [
                Offstage(
                  offstage: controller.isLoading.value,
                  child: const Center(
                    child: CircularProgressIndicator(color: TColors.green),
                  ),
                ),
                GoogleMap(
                  scrollGesturesEnabled: true,
                  style: controller.loadMapStyle,
                  myLocationButtonEnabled: false,
                  onMapCreated: controller.setMapController,
                  markers: Set<Marker>.of(controller.markers),
                  initialCameraPosition: controller.initialCameraPosition(),
                  padding: const EdgeInsets.only(bottom: 24, left: 24),
                ),
              ],
            ),
          ),
          const Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: TExploreHeaderContainer(),
          ),
          const Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ExplorerLocationButton(),
                ExplorerCarouselCard(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
