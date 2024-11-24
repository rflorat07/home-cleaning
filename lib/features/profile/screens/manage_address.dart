import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../controllers/address.controller.dart';
import '../widgets/add_shipping_address.dart';
import 'add_address.dart';

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AddressController());
    return Scaffold(
      appBar: const TAppBar(title: TTexts.manageAddress, showBackArrow: true),
      bottomNavigationBar: TBottomNavigationContainer(
        text: TTexts.apply,
        onPressed: () => Get.back(),
      ),
      body: Obx(
        () => controller.isLoading.value
            ? const CenterCircularProgressIndicator()
            : RefreshIndicator(
                color: TColors.green,
                backgroundColor: Colors.white,
                onRefresh: () => controller.fetchAddressRecord(),
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(
                      horizontal: TSizes.defaultSpace),
                  child: Column(
                    children: [
                      ...List.generate(
                        controller.addresses.length,
                        (index) => TAddressContainer(
                            addres: controller.addresses[index]),
                      ),
                      const SizedBox(height: TSizes.spaceBtwSections),
                      TAddShippingAddress(
                        onPressed: () => Get.to(() => const AddAddressScreen()),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
