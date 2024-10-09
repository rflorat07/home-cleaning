class SpecialOfferModel {
  SpecialOfferModel({
    required this.title,
    required this.offer,
    required this.discount,
    required this.imageUrl,
    required this.services,
    required this.cta,
    required this.upTo,
  });

  final String title, offer, discount, imageUrl, services, cta, upTo;
}

// Our demo Special

List<SpecialOfferModel> demoSpecialOffer = [
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Limited time!',
    discount: '40',
    imageUrl: 'assets/images/background_special.png',
    services:
        'All Services Available | T&C Applied All Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Festival Offer',
    discount: '50',
    imageUrl: 'assets/images/background_special.png',
    services: 'Painter Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Bank Offer',
    discount: '20',
    imageUrl: 'assets/images/background_special.png',
    services: 'Car Repair Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Special Offers',
    discount: '30',
    imageUrl: 'assets/images/background_special.png',
    services: 'Electrician Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Festival Offer',
    discount: '45',
    imageUrl: 'assets/images/background_special.png',
    services: 'Iron Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Limited time!',
    discount: '30',
    imageUrl: 'assets/images/background_special.png',
    services: 'Security Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Bank Offer',
    discount: '40',
    imageUrl: 'assets/images/background_special.png',
    services: 'Beauty Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
  ),
];
