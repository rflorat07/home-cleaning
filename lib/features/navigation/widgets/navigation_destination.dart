import 'package:flutter/material.dart';

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
  final IconData icon, selectedIcon;
  final double iconWidth, iconHeight;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Icon(selectedIcon,
          size: iconWidth, color: TColors.green.withOpacity(0.5)),
      icon: Icon(icon,
          size: iconWidth, color: TColors.darkerGrey.withOpacity(0.5)),
      label: label,
    );
  }
}
