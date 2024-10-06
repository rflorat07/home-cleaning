import 'package:flutter/material.dart';

import '../../../utils/utils.dart';

class CategoryModel {
  CategoryModel({
    required this.icon,
    required this.label,
    required this.backgroundColor,
  });

  final String label;
  final IconData icon;
  final Color backgroundColor;
}

// Our demo CategoryModel

List<CategoryModel> demoCategories = [
  CategoryModel(
    icon: AppIcons.cleaning,
    label: 'Cleaning',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.repairing,
    label: 'Repairing',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.plumbing,
    label: 'Plumbing',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.shifting,
    label: 'Shifting',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  /* CategoryModel(
    icon: AppIcons.painting,
    label: 'Painting',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.laundry,
    label: 'Laundry',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.acRepairing,
    label: 'AC Repairing',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.carRepairing,
    label: 'Car Repairing Repairing',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.electrician,
    label: 'Alectrician',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.carpainter,
    label: 'Carpainter',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.iron,
    label: 'Iron',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.appliance,
    label: 'Appliance',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.beauty,
    label: 'Beauty',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.gardening,
    label: 'Gardening',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.security,
    label: 'Security',
    backgroundColor: const Color(0xFFF6F6F6),
  ),
  CategoryModel(
    icon: AppIcons.massage,
    label: 'Massage',
    backgroundColor: const Color(0xFFF6F6F6),
  ), */
];
