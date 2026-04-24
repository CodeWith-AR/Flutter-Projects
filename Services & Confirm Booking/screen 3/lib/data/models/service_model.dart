class ServiceModel {
  const ServiceModel({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.price,
    required this.currency,
    required this.durationMinutes,
    this.visitType = 'Home visit',
  });

  final String id;
  final String title;
  final String imagePath;
  final double price;
  final String currency;
  final int durationMinutes;
  final String visitType;
}
