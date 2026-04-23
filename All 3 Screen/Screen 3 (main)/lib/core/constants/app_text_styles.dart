import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const TextStyle heading1 = TextStyle(
    fontSize: 28, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
  );
  static const TextStyle heading2 = TextStyle(
    fontSize: 22, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );
  static const TextStyle heading3 = TextStyle(
    fontSize: 18, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.textPrimary,
  );
  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400, color: AppColors.textPrimary,
  );
  static const TextStyle bodySmall = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
  );
  static const TextStyle label = TextStyle(
    fontSize: 13, fontWeight: FontWeight.w500, color: AppColors.textPrimary,
  );
  static const TextStyle caption = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w400, color: AppColors.textSecondary,
  );
  static const TextStyle button = TextStyle(
    fontSize: 15, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );

  // Screen-specific
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
    letterSpacing: -0.3,
  );
  static const TextStyle providerName = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
  );
  static const TextStyle serviceTitle = TextStyle(
    fontSize: 17, fontWeight: FontWeight.w700, color: AppColors.textPrimary,
    letterSpacing: -0.2,
  );
  static const TextStyle serviceDesc = TextStyle(
    fontSize: 12.5, fontWeight: FontWeight.w400, color: AppColors.textMuted,
    height: 1.55,
  );
  static const TextStyle footerItem = TextStyle(
    fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textMuted,
  );
  static const TextStyle chipLabel = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w500,
  );
  static const TextStyle ratingLabel = TextStyle(
    fontSize: 11, fontWeight: FontWeight.w600, color: Colors.white,
  );
  static const TextStyle ratingCount = TextStyle(
    fontSize: 10, fontWeight: FontWeight.w400,
    color: Color(0xBFFFFFFF),
  );
  static const TextStyle bottomBarLabel = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w600, color: AppColors.textPrimary,
  );
  static const TextStyle searchHint = TextStyle(
    fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xFFAAAAAA),
  );
}
