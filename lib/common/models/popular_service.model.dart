import 'package:cloud_firestore/cloud_firestore.dart';

class PopularServiceModel {
  PopularServiceModel({
    required this.id,
    required this.title,
    required this.name,
    required this.money,
    required this.rating,
    required this.offer,
    required this.address,
    required this.imageUrl,
    required this.isBookmark,
  });

  /// Map Jsob oriented document snapshot from Firebase
  factory PopularServiceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return PopularServiceModel.empty();

    final data = document.data()!;

    return PopularServiceModel(
      id: document.id,
      title: data['title'],
      name: data['name'],
      money: data['money'],
      rating: data['rating'],
      offer: data['offer'],
      address: data['address'],
      imageUrl: data['imageUrl'],
      isBookmark: data['isBookmark'] ?? false,
    );
  }

  bool isBookmark;
  final String id, imageUrl, title, address, name, money, rating, offer;

  static PopularServiceModel empty() => PopularServiceModel(
        id: '',
        title: '',
        name: '',
        money: '',
        rating: '',
        address: '',
        offer: '',
        imageUrl: '',
        isBookmark: false,
      );

  /// Convert model to Json structure
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'name': name,
      'money': money,
      'rating': rating,
      'address': address,
      'offer': offer,
      'imageUrl': imageUrl,
      'isBookmark': isBookmark,
    };
  }
}

// Our demo Popular

List<PopularServiceModel> demoPopularService = [
  PopularServiceModel(
    id: '1',
    title: 'Deep House Cleaning',
    name: 'Jenny Wilson',
    money: '\$180.00',
    rating: '4.8',
    offer: 'Home Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: '',
    isBookmark: false,
  ),
  PopularServiceModel(
    id: '1',
    title: 'Car Repairing Service',
    name: 'Leslie Alexander',
    money: '\$250.00',
    rating: '4.8',
    offer: 'Car Repair',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: '',
    isBookmark: false,
  ),
  PopularServiceModel(
    id: '1',
    title: 'Floor Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.5',
    offer: 'Floor Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: '',
    isBookmark: false,
  ),
  PopularServiceModel(
    id: '1',
    title: 'Glass Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.1',
    offer: 'Glass Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: '',
    isBookmark: false,
  ),
  PopularServiceModel(
    id: '1',
    title: 'Kitchen  Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.0',
    offer: 'Kitchen Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: '',
    isBookmark: false,
  ),
  PopularServiceModel(
    id: '1',
    title: 'Deep House Cleaning',
    name: 'Jenny Wilson',
    money: '\$180.00',
    rating: '4.8',
    offer: 'Home Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: '',
    isBookmark: false,
  ),
  PopularServiceModel(
    id: '1',
    title: 'Floor Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.5',
    offer: 'Floor Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: '',
    isBookmark: false,
  ),
  PopularServiceModel(
    id: '1',
    title: 'Glass Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.1',
    offer: 'Glass Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: '',
    isBookmark: false,
  ),
  PopularServiceModel(
    id: '1',
    title: 'Kitchen  Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.0',
    offer: 'Kitchen Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: '',
    isBookmark: false,
  ),
];
