import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../common/common.dart';
import '../../../common/controllers/map.controller.dart';
import '../../../utils/utils.dart';

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
                    SizedBox(
                      height: TSizes.size35,
                      child: ListView.separated(
                        padding:
                            const EdgeInsets.only(left: TSizes.defaultSpace),
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          final chip = [
                            'Home',
                            'Parent’s House',
                            'Farm House',
                            'Other'
                          ];
                          return ChoiceChip(
                            label: Text(chip[index]),
                            padding: const EdgeInsets.all(TSizes.size6),
                            labelStyle: TextStyle(
                                fontSize: TSizes.fontSize12,
                                fontWeight: FontWeight.w500,
                                color:
                                    index == 0 ? TColors.white : TColors.dark),
                            onSelected: (value) {},
                            selected: index == 0,
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBox(width: TSizes.size8),
                      ),
                    ),

                    const SizedBox(height: TSizes.size16),

                    const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: TSizes.defaultSpace),
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              /// Complete address
                              CustomTextFormField(
                                maxLines: 5,
                                labelText: TTexts.completeAddress,
                                placeholder: TTexts.completeAddressPlaceholder,
                              ),

                              SizedBox(height: TSizes.size16),

                              /// Floor
                              CustomTextFormField(
                                labelText: TTexts.floor,
                                placeholder: TTexts.floorPlaceholder,
                              ),

                              SizedBox(height: TSizes.size16),

                              /// Landmark
                              CustomTextFormField(
                                labelText: TTexts.landmark,
                                placeholder: TTexts.landmarkPlaceholder,
                              ),
                            ],
                          ),
                        )),

                    //
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
