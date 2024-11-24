import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../common/common.dart';

class AddressModel {
  AddressModel({
    required this.id,
    required this.name,
    required this.address,
    required this.floor,
    required this.landmark,
    required this.geo,
  });

  factory AddressModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return AddressModel.empty();

    final json = document.data()!;

    return AddressModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      floor: json['floor'],
      landmark: json['landmark'],
      geo: GeoModel.fromJson(json['geo']),
    );
  }

  String id;
  String name;
  String address;
  String floor;
  String landmark;
  GeoModel? geo;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'address': address,
        'floor': floor,
        'landmark': landmark,
        'geo': geo?.toJson(),
      };

  static AddressModel empty() => AddressModel(
        id: '',
        name: '',
        address: '',
        floor: '',
        landmark: '',
        geo: null,
      );
}
