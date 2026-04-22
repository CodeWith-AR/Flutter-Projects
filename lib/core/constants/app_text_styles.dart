import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  static const TextStyle heroBanner = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
    height: 1.2,
  );

  static const TextStyle sectionTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle sectionSubtitle = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle viewAll = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle badge = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.textWhite,
  );

  static const TextStyle cardBrand = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle cardName = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle priceOld = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.priceCrossed,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle priceNew = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w700,
    color: AppColors.priceNew,
  );

  static const TextStyle ratingCount = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle navLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w500,
  );
}
