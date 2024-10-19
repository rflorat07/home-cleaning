import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../features/profile/models/address.model.dart';
import '../../../utils/utils.dart';

class TAddressContainer extends StatelessWidget {
  const TAddressContainer({
    super.key,
    required this.addres,
  });

  final AddressModel addres;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return ListTile(
      onTap: () {},
      iconColor: TColors.dark,
      horizontalTitleGap: TSizes.size6,
      minVerticalPadding: TSizes.size16,
      titleAlignment: ListTileTitleAlignment.titleHeight,
      title: Text(addres.name, style: textTheme.bodyLarge),
      leading: const Icon(IconsaxPlusLinear.location, size: TSizes.size22),
      subtitle: Text(
        addres.address,
        style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
      ),
    );
  }
}
