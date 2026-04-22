import 'package:flutter/material.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../data/models/product_model.dart';
import 'product_card.dart';

class HorizontalProductList extends StatelessWidget {
  const HorizontalProductList({super.key, required this.products});

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.productCardH,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.pageHPadding),
        itemCount: products.length,
        itemBuilder: (_, i) => Padding(
          padding: EdgeInsets.only(right: i < products.length - 1 ? AppDimens.d12 : 0),
          child: ProductCard(product: products[i]),
        ),
      ),
    );
  }
}
