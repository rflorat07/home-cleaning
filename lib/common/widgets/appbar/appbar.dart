import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.systemOverlayStyle = SystemUiOverlayStyle.dark,
  });

  ///  * Title String or Widget.
  final dynamic title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final SystemUiOverlayStyle systemOverlayStyle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: TSizes.md),
      child: AppBar(
        centerTitle: true,
        systemOverlayStyle: systemOverlayStyle,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        leading: showBackArrow
            ? IconButton.outlined(
                iconSize: TSizes.appBarIconSize,
                style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    side: const BorderSide(color: TColors.borderPrimary)),
                onPressed: () => Get.back(),
                icon: const Icon(Icons.arrow_back),
              )
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,
        title: title is String
            ? Text(title, style: Theme.of(context).textTheme.titleMedium)
            : title,
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
