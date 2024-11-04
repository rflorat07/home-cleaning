import 'package:cloud_firestore/cloud_firestore.dart';

class SpecialOfferModel {
  SpecialOfferModel({
    required this.id,
    required this.title,
    required this.offer,
    required this.discount,
    required this.imageUrl,
    required this.services,
    required this.cta,
    required this.upTo,
  });

  /// Map Jsob oriented document snapshot from Firebase
  factory SpecialOfferModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() == null) return SpecialOfferModel.empty();

    final data = document.data()!;

    return SpecialOfferModel(
      cta: data['cta'],
      title: data['title'],
      offer: data['offer'],
      discount: data['discount'],
      imageUrl: data['imageUrl'],
      services: data['services'],
      upTo: data['upTo'],
      id: document.id,
    );
  }

  final String id, title, offer, discount, imageUrl, services, cta, upTo;

  /// Empty Helper Function
  static SpecialOfferModel empty() => SpecialOfferModel(
        id: '',
        title: '',
        cta: '',
        offer: '',
        discount: '',
        imageUrl: '',
        services: '',
        upTo: '',
      );

  /// Convert model to Json structure
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'cta': cta,
      'offer': offer,
      'discount': discount,
      'imageUrl': imageUrl,
      'services': services,
      'upTo': upTo
    };
  }
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
    id: '1',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Festival Offer',
    discount: '50',
    imageUrl: 'assets/images/background_special.png',
    services: 'Painter Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
    id: '2',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Bank Offer',
    discount: '20',
    imageUrl: 'assets/images/background_special.png',
    services: 'Car Repair Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
    id: '3',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Special Offers',
    discount: '30',
    imageUrl: 'assets/images/background_special.png',
    services: 'Electrician Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
    id: '4',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Festival Offer',
    discount: '45',
    imageUrl: 'assets/images/background_special.png',
    services: 'Iron Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
    id: '5',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Limited time!',
    discount: '30',
    imageUrl: 'assets/images/background_special.png',
    services: 'Security Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
    id: '6',
  ),
  SpecialOfferModel(
    title: 'Get Special Offer',
    offer: 'Bank Offer',
    discount: '40',
    imageUrl: 'assets/images/background_special.png',
    services: 'Beauty Services Available | T&C Applied',
    cta: 'Claim',
    upTo: 'upTo',
    id: '7',
  ),
];
