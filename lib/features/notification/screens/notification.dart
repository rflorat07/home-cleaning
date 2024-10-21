import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        backgroundColor: TColors.white,
        title: TTexts.notification,
        actions: [
          TRoundedContainer(
            height: TSizes.size35,
            backgroundColor: TColors.green,
            padding: const EdgeInsets.symmetric(horizontal: TSizes.size10),
            borderRadius:
                const BorderRadius.all(Radius.circular(TSizes.size60)),
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
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TSectionHeading(
              title: 'TODAY',
              horizontal: TSizes.defaultSpace,
              vertical: TSizes.spaceBtwItems,
              textStyle: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
              buttonTitle: 'Mark all as read',
              textButtonStyle:
                  textTheme.bodyMedium!.apply(color: TColors.green),
            ),
            ListTile(
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
                'Service Booked Successfully',
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
              ),
              trailing: Text(
                '1h',
                style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
              ),
            ),
            ListTile(
              tileColor: TColors.whiteSmoke,
              titleAlignment: ListTileTitleAlignment.top,
              leading: const TCircularIcon(
                width: TSizes.size56,
                height: TSizes.size56,
                icon: IconsaxPlusLinear.ticket_star,
                iconColor: TColors.green,
                backgroundColor: TColors.white,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.size12,
              ),
              horizontalTitleGap: TSizes.size14,
              title: Text(
                '50% Off on Home Cleaning',
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
              ),
              trailing: Text(
                '1h',
                style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
              ),
            ),
            ListTile(
              titleAlignment: ListTileTitleAlignment.top,
              leading: const TCircularIcon(
                width: TSizes.size56,
                height: TSizes.size56,
                icon: IconsaxPlusLinear.star_1,
                iconColor: TColors.green,
                backgroundColor: TColors.whiteSmoke,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.size12,
              ),
              horizontalTitleGap: TSizes.size14,
              title: Text(
                'Service Review Request',
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
              ),
              trailing: Text(
                '1h',
                style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
              ),
            ),

            const SizedBox(height: TSizes.size8),

            // TSectionHeading
            TSectionHeading(
              title: 'YESTERDAY',
              horizontal: TSizes.defaultSpace,
              vertical: TSizes.spaceBtwItems,
              textStyle: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
              buttonTitle: 'Mark all as read',
              textButtonStyle:
                  textTheme.bodyMedium!.apply(color: TColors.green),
            ),
            ListTile(
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
                'Service Booked Successfully',
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
              ),
              trailing: Text(
                '1h',
                style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
              ),
            ),
            ListTile(
              tileColor: TColors.whiteSmoke,
              titleAlignment: ListTileTitleAlignment.top,
              leading: const TCircularIcon(
                width: TSizes.size56,
                height: TSizes.size56,
                icon: IconsaxPlusLinear.wallet_3,
                iconColor: TColors.green,
                backgroundColor: TColors.white,
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: TSizes.defaultSpace,
                vertical: TSizes.size12,
              ),
              horizontalTitleGap: TSizes.size14,
              title: Text(
                'New Paypal Added',
                style: textTheme.titleMedium,
              ),
              subtitle: Text(
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                style: textTheme.bodyMedium!.apply(color: TColors.darkerGrey),
              ),
              trailing: Text(
                '1h',
                style: textTheme.labelLarge!.apply(color: TColors.darkerGrey),
              ),
            ),

            const SizedBox(height: TSizes.spaceBtwSections),
          ],
        ),
      ),
    );
  }
}
