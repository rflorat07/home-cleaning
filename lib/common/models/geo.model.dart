class GeoModel {
  GeoModel({
    required this.lat,
    required this.lng,
  });

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        lat: json['lat']?.toDouble(),
        lng: json['lng']?.toDouble(),
      );
  double lat;
  double lng;

  Map<String, dynamic> toJson() => {
        'lat': lat,
        'lng': lng,
      };
}
