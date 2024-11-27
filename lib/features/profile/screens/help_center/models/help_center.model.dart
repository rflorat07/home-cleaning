import 'package:cloud_firestore/cloud_firestore.dart';

class HelpCenterModel {
  HelpCenterModel({
    this.icon,
    required this.id,
    required this.title,
    required this.content,
    required this.expanded,
  });

  factory HelpCenterModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return HelpCenterModel.empty();

    final json = document.data()!;

    return HelpCenterModel(
      id: json['id'],
      icon: json['icon'],
      title: json['title'],
      content: json['content'],
      expanded: json['expanded'],
    );
  }

  final bool expanded;
  final String? icon;
  final String id, title, content;

  Map<String, dynamic> toJson() => {
        'id': id,
        'icon': icon,
        'title': title,
        'content': content,
        'expanded': expanded,
      };

  static HelpCenterModel empty() => HelpCenterModel(
        id: '',
        icon: '',
        title: '',
        content: '',
        expanded: false,
      );
}
