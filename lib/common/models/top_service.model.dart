import 'package:cloud_firestore/cloud_firestore.dart';

import '../../utils/constants/image_strings.dart';

class TopServiceModel {
  TopServiceModel({
    required this.id,
    required this.title,
    required this.name,
    required this.service,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });

  factory TopServiceModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return TopServiceModel.empty();

    final data = document.data()!;

    return TopServiceModel(
      id: document.id,
      title: data['title'],
      name: data['name'],
      service: data['service'],
      rating: data['rating'],
      reviews: data['reviews'],
      imageUrl: data['imageUrl'],
    );
  }

  final String id, title, name, service, rating, reviews, imageUrl;

  static TopServiceModel empty() => TopServiceModel(
        id: '',
        title: '',
        name: '',
        service: '',
        rating: '',
        reviews: '',
        imageUrl: '',
      );

  /// Convert model to Json structure
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'name': name,
      'service': service,
      'rating': rating,
      'reviews': reviews,
      'imageUrl': imageUrl,
    };
  }
}

// Our demo TopServiceModel

List<TopServiceModel> demoTopService = [
  TopServiceModel(
    id: '1',
    title: 'Proffesional Services',
    name: 'Esther T.',
    service: 'Home Cleaning',
    rating: '4.8',
    reviews: '49',
    imageUrl: TImages.carouselSpecial,
  ),
  TopServiceModel(
    id: '2',
    title: 'Proffesional Services',
    name: 'Jenny M.',
    service: 'Car Repair',
    rating: '4.5',
    reviews: '48',
    imageUrl: TImages.carouselSpecial,
  ),
  TopServiceModel(
    id: '3',
    title: 'Proffesional Services',
    name: 'Jacob U.',
    service: 'Gardening',
    rating: '4.1',
    reviews: '60',
    imageUrl: TImages.carouselSpecial,
  ),
  TopServiceModel(
    id: '4',
    title: 'Proffesional Services',
    name: 'Bessi K.',
    service: 'Electrician',
    rating: '4.0',
    reviews: '20',
    imageUrl: TImages.carouselSpecial,
  ),
  TopServiceModel(
    id: '5',
    title: 'Proffesional Services',
    name: 'Jenny Wilson',
    service: 'Home Cleaning',
    rating: '4.8',
    reviews: '49',
    imageUrl: TImages.carouselSpecial,
  ),
];
