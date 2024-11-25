import 'package:flutter/material.dart';

import '../../../common/common.dart';
import '../../../utils/utils.dart';

class InviteFriendsScreen extends StatelessWidget {
  const InviteFriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: const TAppBar(showBackArrow: true, title: TTexts.inviteFriends),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          children: [
            ...List.generate(
              15,
              (index) => ListTile(
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Darlene Robertson',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.titleMedium,
                    ),
                    const SizedBox(height: TSizes.size4),
                    Text(
                      '207.555.0119',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textTheme.bodyMedium!
                          .apply(color: TColors.darkerGrey),
                    ),
                  ],
                ),
                horizontalTitleGap: TSizes.size13,
                minVerticalPadding: TSizes.spaceBtwItems,
                leading: const CircleAvatar(
                  radius: TSizes.defaultSpace,
                  backgroundColor: TColors.lightSilver,
                ),
                trailing: SizedBox(
                  height: TSizes.size30,
                  child: FilledButton(
                    onPressed: () {},
                    style: const ButtonStyle(
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(
                          horizontal: TSizes.size8,
                          vertical: TSizes.size4,
                        ),
                      ),
                    ),
                    child: Text(
                      'Invite',
                      style: textTheme.labelLarge!.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace),
          ],
        ),
      ),
    );
  }
}
