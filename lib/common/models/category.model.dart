import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class CategoryModel {
  CategoryModel({
    required this.id,
    required this.icon,
    required this.label,
  });

  /// Map Jsob oriented document snapshot from Firebase to UserModel
  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return CategoryModel.empty();

    final data = document.data()!;

    return CategoryModel(
      id: document.id,
      label: data['label'],
      icon: AppIcons.getIconDataFromName(data['icon']),
    );
  }

  final String id, label;
  final IconData icon;

  /// Empty Helper Function
  static CategoryModel empty() =>
      CategoryModel(id: '', icon: AppIcons.cleaning, label: '');

  /// Convert model to Json structure
  Map<String, dynamic> toJson() {
    return {'id': id, 'icon': icon, 'label': label};
  }
}

// Our demo CategoryModel
/* List<CategoryModel> demoCategories = [
  CategoryModel(id: '1', icon: 'cleaning', label: 'Cleaning'),
  CategoryModel(id: '2', icon: 'repairing', label: 'Repairing'),
  CategoryModel(id: '3', icon: 'plumbing', label: 'Plumbing'),
  CategoryModel(id: '4', icon: 'shifting', label: 'Shifting'),
  CategoryModel(id: '5', icon: 'painting', label: 'Painting'),
  CategoryModel(id: '6', icon: 'laundry', label: 'Laundry'),
  CategoryModel(id: '7', icon: 'acRepair', label: 'AC Repairing'),
  CategoryModel(id: '8', icon: 'carRepair', label: 'Car Repairing'),
  CategoryModel(id: '9', icon: 'electrician', label: 'Alectrician'),
  CategoryModel(id: '10', icon: 'carpainter', label: 'Carpainter'),
  CategoryModel(id: '11', icon: 'iron', label: 'Iron'),
  CategoryModel(id: '12', icon: 'appliance', label: 'Appliance'),
  CategoryModel(id: '13', icon: 'beauty', label: 'Beauty'),
  CategoryModel(id: '14', icon: 'gardening', label: 'Gardening'),
  CategoryModel(id: '15', icon: 'security', label: 'Security'),
  CategoryModel(id: '16', icon: 'massage', label: 'Massage'),
]; */
