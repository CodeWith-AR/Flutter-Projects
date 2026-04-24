import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  AppTextStyles._();

  // AppBar
  static const TextStyle appBarTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // Section labels ("Select Date", "Prices", etc.)
  static const TextStyle sectionLabel = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // "Change" link
  static const TextStyle changeLink = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Service card — title
  static const TextStyle serviceTitle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    height: 1.4,
  );

  // Meta text (AED, duration)
  static const TextStyle metaText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  // Home visit chip
  static const TextStyle chipLabel = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w600,
    color: AppColors.chipGreen,
  );

  // Tab label active
  static const TextStyle tabActive = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.tabActive,
  );

  // Tab label inactive
  static const TextStyle tabInactive = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.tabInactive,
  );

  // Date selector — day abbr
  static const TextStyle dateDayAbbr = TextStyle(
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );

  // Date selector — number
  static const TextStyle dateNumber = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  // Date selector — month abbr
  static const TextStyle dateMonthAbbr = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );

  // Time slot
  static const TextStyle timeSlotActive = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w600,
    color: AppColors.timeActiveText,
  );

  static const TextStyle timeSlotInactive = TextStyle(
    fontSize: 13,
    fontWeight: FontWeight.w500,
    color: AppColors.timeText,
  );

  // Prices value
  static const TextStyle priceValue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // Location city
  static const TextStyle locationCity = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // Location detail
  static const TextStyle locationDetail = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    height: 1.5,
  );

  // Cancel button
  static const TextStyle btnCancel = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  // Confirm button
  static const TextStyle btnConfirm = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: AppColors.textWhite,
  );
}
