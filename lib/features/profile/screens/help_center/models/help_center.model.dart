import 'package:cloud_firestore/cloud_firestore.dart';

class HelpCenterModel {
  HelpCenterModel({
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
      title: json['title'],
      content: json['content'],
      expanded: json['expanded'],
    );
  }

  String id, title, content;
  bool expanded;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'expanded': expanded,
      };

  static HelpCenterModel empty() => HelpCenterModel(
        id: '',
        title: '',
        content: '',
        expanded: false,
      );
}
