import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class ServiceProviderDetailsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ServiceProviderDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TAppBar(
      showBackArrow: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      title: TTexts.serviceProvider,
      actions: [
        IconButton.outlined(
          iconSize: TSizes.appBarIconSize,
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: TColors.borderPrimary)),
          onPressed: () {},
          icon: const Icon(Icons.share),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
