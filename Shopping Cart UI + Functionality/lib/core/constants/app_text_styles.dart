import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // AppBar
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 0.2,
  );

  // Cart item
  static const TextStyle itemName = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle itemBrand = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle itemPrice = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrice,
  );

  static const TextStyle qtyNumber = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  // Order summary
  static const TextStyle summaryTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle summaryLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
  );

  static const TextStyle summaryValue = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle totalLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle totalValue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // Checkout button
  static const TextStyle checkoutBtn = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
    letterSpacing: 0.3,
  );
}
