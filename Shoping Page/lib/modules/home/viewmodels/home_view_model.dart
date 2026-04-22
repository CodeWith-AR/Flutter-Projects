import 'package:flutter/foundation.dart';
import '../../../data/models/product_model.dart';
import '../../../core/constants/app_assets.dart';

class HomeViewModel extends ChangeNotifier {
  int selectedNavIndex = 0;

  void setNavIndex(int i) {
    selectedNavIndex = i;
    notifyListeners();
  }


  final List<ProductModel> saleProducts = const [
    ProductModel(
      id: '1',
      brand: 'Dorothy Perkins',
      name: 'Evening Dress',
      imagePath: AppAssets.img1,
      oldPrice: 15,
      newPrice: 12,
      rating: 5,
      reviewCount: 10,
      discountLabel: '-20%',
    ),
    ProductModel(
      id: '2',
      brand: 'Sitlly',
      name: 'Sport Dress',
      imagePath: AppAssets.img2,
      oldPrice: 22,
      newPrice: 19,
      rating: 5,
      reviewCount: 10,
      discountLabel: '-15%',
    ),
    ProductModel(
      id: '3',
      brand: 'Dorothy',
      name: 'Sport Dress',
      imagePath: AppAssets.img3,
      oldPrice: 14,
      newPrice: 11,
      rating: 4,
      reviewCount: 8,
      discountLabel: '-20%',
    ),
  ];


  final List<ProductModel> newProducts = const [
    ProductModel(
      id: '4',
      brand: 'Zara',
      name: 'Red Blouse',
      imagePath: AppAssets.img4,
      oldPrice: 0,
      newPrice: 25,
      rating: 4,
      reviewCount: 5,
      isNew: true,
    ),
    ProductModel(
      id: '5',
      brand: 'H&M',
      name: 'White Tee',
      imagePath: AppAssets.img5,
      oldPrice: 0,
      newPrice: 18,
      rating: 4,
      reviewCount: 3,
      isNew: true,
    ),
    ProductModel(
      id: '6',
      brand: 'Mango',
      name: 'Print Tee',
      imagePath: AppAssets.img6,
      oldPrice: 0,
      newPrice: 20,
      rating: 5,
      reviewCount: 6,
      isNew: true,
    ),
  ];
}
