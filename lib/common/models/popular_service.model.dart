class PopularServiceModel {
  PopularServiceModel({
    required this.title,
    required this.name,
    required this.money,
    required this.rating,
    required this.offer,
    required this.address,
    this.imageUrl,
  });

  final String? imageUrl;
  final String title, address, name, money, rating, offer;

  static PopularServiceModel empty() => PopularServiceModel(
        title: '',
        name: '',
        money: '',
        rating: '',
        address: '',
        offer: '',
        imageUrl: null,
      );
}

// Our demo Popular

List<PopularServiceModel> demoPopularService = [
  PopularServiceModel(
    title: 'Deep House Cleaning',
    name: 'Jenny Wilson',
    money: '\$180.00',
    rating: '4.8',
    offer: 'Home Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: null,
  ),
  PopularServiceModel(
    title: 'Car Repairing Service',
    name: 'Leslie Alexander',
    money: '\$250.00',
    rating: '4.8',
    offer: 'Car Repair',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: null,
  ),
  PopularServiceModel(
    title: 'Floor Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.5',
    offer: 'Floor Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: null,
  ),
  PopularServiceModel(
    title: 'Glass Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.1',
    offer: 'Glass Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: null,
  ),
  PopularServiceModel(
    title: 'Kitchen  Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.0',
    offer: 'Kitchen Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: null,
  ),
  PopularServiceModel(
    title: 'Deep House Cleaning',
    name: 'Jenny Wilson',
    money: '\$180.00',
    rating: '4.8',
    offer: 'Home Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: null,
  ),
  PopularServiceModel(
    title: 'Floor Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.5',
    offer: 'Floor Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: null,
  ),
  PopularServiceModel(
    title: 'Glass Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.1',
    offer: 'Glass Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: null,
  ),
  PopularServiceModel(
    title: 'Kitchen  Cleaning',
    name: 'Jenny Wilson',
    money: '\$60.00',
    rating: '4.0',
    offer: 'Kitchen Cleaning',
    address: '1012 Ocean avanue, New York, USA',
    imageUrl: null,
  ),
];
