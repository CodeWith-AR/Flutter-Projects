import '../../core/constants/app_assets.dart';

class CartItemModel {
  const CartItemModel({
    required this.id,
    required this.name,
    required this.brand,
    required this.imagePath,
    required this.unitPrice,
    required this.quantity,
  });

  final String id;
  final String name;
  final String brand;
  final String imagePath;
  final double unitPrice;
  final int quantity;

  double get lineTotal => unitPrice * quantity;

  CartItemModel copyWith({int? quantity}) {
    return CartItemModel(
      id: id,
      name: name,
      brand: brand,
      imagePath: imagePath,
      unitPrice: unitPrice,
      quantity: quantity ?? this.quantity,
    );
  }

  // Mock Data
  static const List<CartItemModel> mockItems = [
    CartItemModel(
      id: '1',
      name: 'Watch',
      brand: 'Rolex',
      imagePath: AppAssets.img1,
      unitPrice: 40,
      quantity: 2,
    ),
    CartItemModel(
      id: '2',
      name: 'Airpods',
      brand: 'Apple',
      imagePath: AppAssets.img2,
      unitPrice: 333,
      quantity: 2,
    ),
    CartItemModel(
      id: '3',
      name: 'Hoodie',
      brand: 'Puma',
      imagePath: AppAssets.img3,
      unitPrice: 50,
      quantity: 2,
    ),
  ];
}
