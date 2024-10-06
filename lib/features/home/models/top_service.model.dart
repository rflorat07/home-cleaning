import '../../../utils/constants/image_strings.dart';

class TopServiceModel {
  TopServiceModel({
    required this.title,
    required this.name,
    required this.service,
    required this.rating,
    required this.reviews,
    required this.imageUrl,
  });

  final String title;
  final String name;
  final String service;
  final String rating;
  final String reviews;
  final String imageUrl;
}

// Our demo TopServiceModel

List<TopServiceModel> demoTopService = [
  TopServiceModel(
    title: 'Proffesional Services',
    name: 'Esther T.',
    service: 'Home Cleaning',
    rating: '4.8',
    reviews: '49',
    imageUrl: TImages.carouselSpecial,
  ),
  TopServiceModel(
    title: 'Proffesional Services',
    name: 'Jenny M.',
    service: 'Car Repair',
    rating: '4.5',
    reviews: '48',
    imageUrl: TImages.carouselSpecial,
  ),
  TopServiceModel(
    title: 'Proffesional Services',
    name: 'Jacob U.',
    service: 'Gardening',
    rating: '4.1',
    reviews: '60',
    imageUrl: TImages.carouselSpecial,
  ),
  TopServiceModel(
    title: 'Proffesional Services',
    name: 'Bessi K.',
    service: 'Electrician',
    rating: '4.0',
    reviews: '20',
    imageUrl: TImages.carouselSpecial,
  ),
  TopServiceModel(
    title: 'Proffesional Services',
    name: 'Jenny Wilson',
    service: 'Home Cleaning',
    rating: '4.8',
    reviews: '49',
    imageUrl: TImages.carouselSpecial,
  ),
];
