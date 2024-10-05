class SpecialOfferModel {
  SpecialOfferModel({
    required this.title,
    required this.offer,
    required this.discount,
    required this.imageUrl,
  });

  final String title;
  final String offer;
  final String discount;
  final String imageUrl;
}

// Our demo Special

List<SpecialOfferModel> demoSpecialOffer = [
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Limited time!',
    discount: '40',
    imageUrl: 'assets/images/background_special.png',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Festival Offer',
    discount: '50',
    imageUrl: 'assets/images/background_special.png',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Bank Offer',
    discount: '20',
    imageUrl: 'assets/images/background_special.png',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Special Offers',
    discount: '30',
    imageUrl: 'assets/images/background_special.png',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Festival Offer',
    discount: '45',
    imageUrl: 'assets/images/background_special.png',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Limited time!',
    discount: '30',
    imageUrl: 'assets/images/background_special.png',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Bank Offer',
    discount: '40',
    imageUrl: 'assets/images/background_special.png',
  ),
];
