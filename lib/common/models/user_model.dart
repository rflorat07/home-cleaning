import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.profilePicture,
  });

  /// Factory method to create a UserModel from a Firebase document snapshot
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        name: data['Name'] ?? '',
        email: data['Email'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }

  final String id, email;
  String name, profilePicture;

  /// Helper function to get the full name
  String get fullName => name;

  /// Static function to split full name into first and last name.
  static List<String> nameParts(fullName) => fullName.split(' ');

  /// Static function to generate a username from the full name..
  static String generateUsername(fullName) {
    List<String> nameParts = fullName.split(' ');
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : '';

    String camelCaseUsername = '$firstName$lastName';
    String usernameWithPrefix = 'cwt_$camelCaseUsername'; // Add "cwt_" prefix
    return usernameWithPrefix;
  }

  /// Static function to create an emptu user model.
  static UserModel empty() =>
      UserModel(id: '', name: '', email: '', profilePicture: '');

  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Email': email,
      'ProfilePicture': profilePicture,
    };
  }
}
