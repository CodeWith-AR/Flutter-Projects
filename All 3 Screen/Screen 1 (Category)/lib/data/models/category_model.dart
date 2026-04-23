import 'package:flutter/material.dart';
import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
class CategoryModel {
  const CategoryModel({
    required this.id,
    required this.label,
    required this.iconPath,
    required this.iconColor,
    required this.cardColor,
  });

  final String id;
  final String label;
  final String iconPath;
  final Color iconColor;
  final Color cardColor;

  static const List<CategoryModel> allCategories = [
    // Row 0 — warm
    CategoryModel(id: 'm1',  label: 'Massage',     iconPath: AppAssets.massage,      iconColor: AppColors.pink,     cardColor: AppColors.cardWarm),
    CategoryModel(id: 'f1',  label: 'Foot Spa',    iconPath: AppAssets.footSpa,      iconColor: AppColors.teal,     cardColor: AppColors.cardWarm),
    CategoryModel(id: 'n1',  label: 'Nutritionist',iconPath: AppAssets.nutritionist, iconColor: AppColors.greyBlue, cardColor: AppColors.cardWarm),
    CategoryModel(id: 'ft1', label: 'Fitness',     iconPath: AppAssets.fitness,      iconColor: AppColors.pink,     cardColor: AppColors.cardWarm),
    // Row 1 — cool
    CategoryModel(id: 'l1',  label: 'Lactation',   iconPath: AppAssets.lactation,    iconColor: AppColors.pink,     cardColor: AppColors.cardCool),
    CategoryModel(id: 'th1', label: 'Therapy',     iconPath: AppAssets.therapy,      iconColor: AppColors.pink,     cardColor: AppColors.cardCool),
    CategoryModel(id: 'hc1', label: 'Home Care',   iconPath: AppAssets.homeCare,     iconColor: AppColors.greyBlue, cardColor: AppColors.cardCool),
    CategoryModel(id: 'bc1', label: 'Baby Care',   iconPath: AppAssets.babyCare,     iconColor: AppColors.teal,     cardColor: AppColors.cardCool),
  ];
}
