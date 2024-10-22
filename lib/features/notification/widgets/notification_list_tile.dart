import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';
import '../models/notification.model.dart';

class NotificationListTile extends StatelessWidget {
  const NotificationListTile({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Column(
      children: [
        TSectionHeading(
          title: notification.header,
          horizontal: TSizes.defaultSpace,
          vertical: TSizes.spaceBtwItems,
          textStyle: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
          buttonTitle: 'Mark all as read',
          textButtonStyle: textTheme.bodyMedium!.apply(color: TColors.green),
        ),
        ...List.generate(
          notification.items.length,
          (index) => ListTile(
            titleAlignment: ListTileTitleAlignment.top,
            leading: const TCircularIcon(
              width: TSizes.size56,
              height: TSizes.size56,
              icon: IconsaxPlusLinear.calendar_tick,
              iconColor: TColors.green,
              backgroundColor: TColors.whiteSmoke,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: TSizes.defaultSpace,
              vertical: TSizes.size12,
            ),
            horizontalTitleGap: TSizes.size14,
            title: Text(
              notification.items[index].title,
              style: textTheme.titleMedium,
            ),
            subtitle: Text(
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              notification.items[index].subtitle,
              style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
            ),
            trailing: Text(
              '1h',
              style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
            ),
          ),
        ),
      ],
    );
  }
}
