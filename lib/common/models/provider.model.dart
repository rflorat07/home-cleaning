import 'package:cloud_firestore/cloud_firestore.dart';

import 'models.dart';

class ProviderModel {
  ProviderModel({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.address,
    required this.category,
    required this.customer,
    required this.yearsExp,
    required this.rating,
    required this.isBookmark,
    required this.phone,
    required this.reviews,
    required this.images,
    required this.workingHours,
    required this.geo,
    required this.thumbnail,
    required this.services,
  });

  factory ProviderModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return ProviderModel.empty();

    final json = document.data()!;

    return ProviderModel(
      id: json['id'],
      name: json['name'],
      title: json['title'],
      description: json['description'],
      address: json['address'],
      category: json['category'],
      customer: json['customer'],
      yearsExp: json['yearsExp'],
      rating: json['rating'],
      isBookmark: json['isBookmark'],
      phone: json['phone'],
      reviews: List<ReviewModel>.from(
          json['reviews'].map((x) => ReviewModel.fromJson(x))),
      images: List<String>.from(json['images'].map((x) => x)),
      workingHours: List<WorkingHourModel>.from(
          json['workingHours'].map((x) => WorkingHourModel.fromJson(x))),
      geo: GeoModel.fromJson(json['geo']),
      thumbnail: json['thumbnail'],
      services: List<dynamic>.from(json['services'].map((x) => x)),
    );
  }

  String? id;
  String name;
  String title;
  String description;
  String address;
  String category;
  int customer;
  int yearsExp;
  double rating;
  bool isBookmark;
  String phone;
  List<ReviewModel> reviews;
  List<String> images;
  List<WorkingHourModel> workingHours;
  GeoModel? geo;
  String thumbnail;
  List<dynamic> services;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'description': description,
        'address': address,
        'category': category,
        'customer': customer,
        'yearsExp': yearsExp,
        'rating': rating,
        'isBookmark': isBookmark,
        'phone': phone,
        'reviews': List<dynamic>.from(reviews.map((x) => x.toJson())),
        'images': List<dynamic>.from(images.map((x) => x)),
        'workingHours': List<dynamic>.from(workingHours.map((x) => x.toJson())),
        'geo': geo?.toJson(),
        'thumbnail': thumbnail,
        'services': List<dynamic>.from(services.map((x) => x)),
      };

  static ProviderModel empty() => ProviderModel(
        id: null,
        name: '',
        title: '',
        description: '',
        address: '',
        category: '',
        customer: 0,
        yearsExp: 0,
        rating: 0,
        isBookmark: false,
        phone: '',
        reviews: [],
        images: [],
        workingHours: [],
        geo: null,
        thumbnail: '',
        services: [],
      );
}
