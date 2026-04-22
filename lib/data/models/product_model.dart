class ProductModel {
  const ProductModel({
    required this.id,
    required this.brand,
    required this.name,
    required this.imagePath,
    required this.oldPrice,
    required this.newPrice,
    required this.rating,
    required this.reviewCount,
    this.discountLabel,
    this.isNew = false,
  });

  final String id;
  final String brand;
  final String name;
  final String imagePath;
  final double oldPrice;
  final double newPrice;
  final double rating;
  final int reviewCount;
  final String? discountLabel;
  final bool isNew;
}
