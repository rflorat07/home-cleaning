import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../models/address.model.dart';
import '../widgets/add_shipping_address.dart';

class ManageAddressScreen extends StatelessWidget {
  const ManageAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TAppBar(title: TTexts.manageAddress, showBackArrow: true),
      bottomNavigationBar: TBottomNavigationContainer(
        text: TTexts.apply,
        onPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          children: [
            ...List.generate(
              domoAddressModel.length,
              (index) => TAddressContainer(addres: domoAddressModel[index]),
            ),
            const SizedBox(height: TSizes.spaceBtwSections),
            const TAddShippingAddress(),
          ],
        ),
      ),
    );
  }
}
