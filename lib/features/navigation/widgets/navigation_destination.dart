import 'package:flutter/material.dart';
import 'package:home_cleaning/utils/utils.dart';

class TNavigationDestination extends StatelessWidget {
  const TNavigationDestination({
    super.key,
    required this.label,
    required this.selectedIcon,
    required this.icon,
    this.iconWidth = TSizes.lg,
    this.iconHeight = TSizes.lg,
  });

  final String label, selectedIcon, icon;
  final double iconWidth, iconHeight;

  @override
  Widget build(BuildContext context) {
    return NavigationDestination(
      selectedIcon: Image(
        image: AssetImage(selectedIcon),
        width: iconWidth,
        height: iconHeight,
      ),
      icon: Image(
        image: AssetImage(icon),
        width: iconWidth,
        height: iconHeight,
      ),
      label: label,
    );
  }
}
