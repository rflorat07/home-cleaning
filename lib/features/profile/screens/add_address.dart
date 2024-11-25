import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../widgets/add_address_form.dart';
import '../widgets/address_filter_chips.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MapController());
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(
        showBackArrow: true,
        title: TTexts.addAddress,
        backgroundColor: Colors.transparent,
        backArrowBackgroundColor: TColors.white,
      ),
      bottomNavigationBar: TBottomNavigationContainer(
        text: TTexts.saveAddress,
        onPressed: () => Get.back(),
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SizedBox(
              width: double.infinity,
              height: THelperFunctions.screenHeight(context) * 0.45,
              child: Obx(
                () => Stack(
                  children: [
                    Offstage(
                      offstage: controller.isLoading.value,
                      child: const CenterCircularProgressIndicator(),
                    ),
                    GoogleMap(
                      scrollGesturesEnabled: false,
                      style: controller.loadMapStyle,
                      myLocationButtonEnabled: false,
                      onMapCreated: controller.setMapController,
                      markers: Set<Marker>.of(controller.markers),
                      initialCameraPosition: controller.initialCameraPosition(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: THelperFunctions.screenHeight(context) * 0.35,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(top: TSizes.defaultSpace),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(TSizes.size24),
                  topRight: Radius.circular(TSizes.size24),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Save address text
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: TSizes.defaultSpace),
                      child: Text(
                        TTexts.saveAddressAs,
                        style: textTheme.labelLarge!
                            .apply(color: TColors.darkerGrey),
                      ),
                    ),

                    const SizedBox(height: TSizes.size12),

                    // Filter Chips
                    const AddressFilterChips(),

                    const SizedBox(height: TSizes.size16),

                    // Form Add Addresss
                    const AddAddressForm(),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
