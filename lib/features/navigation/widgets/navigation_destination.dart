import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../utils/utils.dart';

class TNavigationDestination extends StatelessWidget {
  const TNavigationDestination({
    super.key,
    required this.label,
    required this.selectedIcon,
    required this.icon,
    this.iconWidth = TSizes.lg,
    this.iconHeight = TSizes.lg,
  });

  final String label;
  final String icon, selectedIcon;
  final double iconWidth, iconHeight;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon:
          SvgPicture.asset(selectedIcon, width: iconWidth, height: iconHeight),
      icon: SvgPicture.asset(icon, width: iconWidth, height: iconHeight),
      label: label,
    );
  }
}
