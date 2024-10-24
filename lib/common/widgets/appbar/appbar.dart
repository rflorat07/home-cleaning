import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/utils.dart';

class TAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TAppBar({
    super.key,
    this.title,
    this.bottom,
    this.actions,
    this.leadingIcon,
    this.leadingOnPressed,
    this.showBackArrow = false,
    this.backgroundColor = Colors.transparent,
    this.systemOverlayStyle = SystemUiOverlayStyle.dark,
  });

  ///  * Title String or Widget.
  final dynamic title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;
  final SystemUiOverlayStyle systemOverlayStyle;
  final Color backgroundColor;
  final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: TSizes.size16),
      child: AppBar(
        centerTitle: true,
        systemOverlayStyle: systemOverlayStyle,
        backgroundColor: backgroundColor,
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
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      TDeviceUtils.getAppBarHeight() + (bottom != null ? TSizes.size50 : 0.0));
}
