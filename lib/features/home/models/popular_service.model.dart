import 'package:home_cleaning/utils/utils.dart';

class PopularService {
  PopularService({
    required this.title,
    required this.name,
    required this.money,
    required this.rating,
    required this.offer,
    required this.imageUrl,
  });

  final String title;
  final String name;
  final String money;
  final String rating;
  final String offer;
  final String imageUrl;
}

// Our demo Popular

List<PopularService> demoPopularService = [
  PopularService(
      title: 'Deep House Cleaning',
      name: 'Jenny Wilson',
      money: '\$180.00',
      rating: '4.8',
      offer: 'Home Cleaning',
      imageUrl: TImages.carouselSpecial),
  PopularService(
      title: 'Floor Cleaning',
      name: 'Jenny Wilson',
      money: '\$60.00',
      rating: '4.5',
      offer: 'Home Cleaning',
      imageUrl: TImages.carouselSpecial),
  PopularService(
      title: 'Glass Cleaning',
      name: 'Jenny Wilson',
      money: '\$60.00',
      rating: '4.1',
      offer: 'Home Cleaning',
      imageUrl: TImages.carouselSpecial),
  PopularService(
      title: 'Kitchen  Cleaning',
      name: 'Jenny Wilson',
      money: '\$60.00',
      rating: '4.0',
      offer: 'Home Cleaning',
      imageUrl: TImages.carouselSpecial),
  PopularService(
      title: 'Deep House Cleaning',
      name: 'Jenny Wilson',
      money: '\$180.00',
      rating: '4.8',
      offer: 'Home Cleaning',
      imageUrl: TImages.carouselSpecial),
  PopularService(
      title: 'Floor Cleaning',
      name: 'Jenny Wilson',
      money: '\$60.00',
      rating: '4.5',
      offer: 'Home Cleaning',
      imageUrl: TImages.carouselSpecial),
  PopularService(
      title: 'Glass Cleaning',
      name: 'Jenny Wilson',
      money: '\$60.00',
      rating: '4.1',
      offer: 'Home Cleaning',
      imageUrl: TImages.carouselSpecial),
  PopularService(
      title: 'Kitchen  Cleaning',
      name: 'Jenny Wilson',
      money: '\$60.00',
      rating: '4.0',
      offer: 'Home Cleaning',
      imageUrl: TImages.carouselSpecial),
];
