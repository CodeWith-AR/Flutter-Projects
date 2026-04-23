class MassageServiceModel {
  final String id;
  final String providerName;
  final String providerAvatarUrl;
  final List<String> imageUrls;
  final double rating;
  final int reviewCount;
  final bool offersHomeVisit;
  final bool offersAtProvider;
  final String serviceTitle;
  final String serviceDescription;
  final double startingPrice;
  final int durationMinutes;
  final String location;
  bool isFavourited;

  MassageServiceModel({
    required this.id,
    required this.providerName,
    required this.providerAvatarUrl,
    required this.imageUrls,
    required this.rating,
    required this.reviewCount,
    required this.offersHomeVisit,
    required this.offersAtProvider,
    required this.serviceTitle,
    required this.serviceDescription,
    required this.startingPrice,
    required this.durationMinutes,
    required this.location,
    this.isFavourited = false,
  });

  factory MassageServiceModel.fromJson(Map<String, dynamic> json) {
    return MassageServiceModel(
      id: json['id'] as String,
      providerName: json['provider_name'] as String,
      providerAvatarUrl: json['provider_avatar_url'] as String,
      imageUrls: List<String>.from(json['image_urls'] as List),
      rating: (json['rating'] as num).toDouble(),
      reviewCount: json['review_count'] as int,
      offersHomeVisit: json['offers_home_visit'] as bool,
      offersAtProvider: json['offers_at_provider'] as bool,
      serviceTitle: json['service_title'] as String,
      serviceDescription: json['service_description'] as String,
      startingPrice: (json['starting_price'] as num).toDouble(),
      durationMinutes: json['duration_minutes'] as int,
      location: json['location'] as String,
      isFavourited: json['is_favourited'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'provider_name': providerName,
    'provider_avatar_url': providerAvatarUrl,
    'image_urls': imageUrls,
    'rating': rating,
    'review_count': reviewCount,
    'offers_home_visit': offersHomeVisit,
    'offers_at_provider': offersAtProvider,
    'service_title': serviceTitle,
    'service_description': serviceDescription,
    'starting_price': startingPrice,
    'duration_minutes': durationMinutes,
    'location': location,
    'is_favourited': isFavourited,
  };
}
