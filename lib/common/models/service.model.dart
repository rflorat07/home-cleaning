import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';

class ServiceModel {
  ServiceModel({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.address,
    required this.category,
    required this.price,
    required this.rating,
    required this.isBookmark,
    required this.phone,
    required this.reviews,
    required this.images,
    required this.workingHours,
    required this.geo,
    required this.thumbnail,
  });

  factory ServiceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ServiceModel.empty();

    final json = document.data()!;

    return ServiceModel(
      id: document.id,
      name: json['name'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      category: json['category'],
      price: json['price']?.toDouble(),
      rating: json['rating']?.toDouble(),
      isBookmark: json['isBookmark'],
      phone: json['phone'],
      reviews: List<ReviewModel>.from(
          json['reviews'].map((x) => ReviewModel.fromJson(x))),
      images: List<String>.from(json['images'].map((x) => x)),
      workingHours: List<WorkingHourModel>.from(
          json['workingHours'].map((x) => WorkingHourModel.fromJson(x))),
      geo: GeoModel.fromJson(json['geo']),
      thumbnail: json['thumbnail'],
    );
  }

  String? id;
  String name;
  String title;
  String description;
  String address;
  String category;
  double price;
  double rating;
  bool isBookmark;
  String phone;
  List<ReviewModel> reviews;
  List<String> images;
  List<WorkingHourModel> workingHours;
  GeoModel? geo;
  String thumbnail;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'description': description,
        'address': address,
        'category': category,
        'price': price,
        'rating': rating,
        'isBookmark': isBookmark,
        'phone': phone,
        'reviews': List<dynamic>.from(reviews.map((x) => x.toJson())),
        'images': List<dynamic>.from(images.map((x) => x)),
        'workingHours': List<dynamic>.from(workingHours.map((x) => x.toJson())),
        'geo': geo?.toJson(),
        'thumbnail': thumbnail,
      };

  static ServiceModel empty() => ServiceModel(
        id: null,
        name: '',
        title: '',
        description: '',
        address: '',
        category: '',
        price: 0.0,
        rating: 0.0,
        isBookmark: false,
        phone: '',
        reviews: [],
        images: [],
        workingHours: [],
        geo: null,
        thumbnail: '',
      );
}
