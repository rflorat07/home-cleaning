import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class NotificationAppbar extends StatelessWidget
    implements PreferredSizeWidget {
  const NotificationAppbar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return TAppBar(
      showBackArrow: true,
      backgroundColor: TColors.white,
      title: TTexts.notification,
      actions: [
        TRoundedContainer(
          height: TSizes.size35,
          backgroundColor: TColors.green,
          padding: const EdgeInsets.symmetric(horizontal: TSizes.size10),
          borderRadius: const BorderRadius.all(Radius.circular(TSizes.size60)),
          child: Center(
            child: Text(
              '2 NEW',
              style: textTheme.labelLarge!.copyWith(
                color: TColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
