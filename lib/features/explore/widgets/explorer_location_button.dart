import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../common/controllers/map.controller.dart';
import '../../../utils/utils.dart';

class ExplorerLocationButton extends StatelessWidget {
  const ExplorerLocationButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = MapController.instance;
    return Padding(
      padding: const EdgeInsets.only(
          right: TSizes.defaultSpace, bottom: TSizes.defaultSpace / 2),
      child: TCircularIcon(
        width: TSizes.size40,
        height: TSizes.size40,
        icon: IconsaxPlusBold.gps,
        onPressed: () => controller.moveToPosition(controller.initialPosition),
        showBorder: true,
        borderWidth: 0.5,
        iconColor: TColors.green,
        backgroundColor: Colors.white,
      ),
    );
  }
}
