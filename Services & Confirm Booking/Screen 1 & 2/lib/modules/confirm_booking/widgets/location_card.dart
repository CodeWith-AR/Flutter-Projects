import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';

class LocationCard extends StatelessWidget {
  const LocationCard({
    super.key,
    required this.city,
    required this.address,
    required this.zipCode,
    required this.onEdit,
  });

  final String city;
  final String address;
  final String zipCode;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppDimens.d16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        border: Border.all(color: AppColors.cardBorder, width: AppDimens.cardBorderW),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // City row + edit
          Row(
            children: [
              Text(city, style: AppTextStyles.locationCity),
              const Spacer(),
              GestureDetector(
                onTap: onEdit,
                child: const Icon(
                  Icons.edit_outlined,
                  color: AppColors.editIcon,
                  size: AppDimens.d20,
                ),
              ),
            ],
          ),

          const SizedBox(height: AppDimens.d8),

          // Address with pin icon
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.location_on_outlined,
                  color: AppColors.textSecondary, size: AppDimens.d14),
              const SizedBox(width: AppDimens.d6),
              Expanded(
                child: Text(address, style: AppTextStyles.locationDetail),
              ),
            ],
          ),

          const SizedBox(height: AppDimens.d4),

          // Zip code
          Row(
            children: [
              const Icon(Icons.push_pin_outlined,
                  color: AppColors.textSecondary, size: AppDimens.d14),
              const SizedBox(width: AppDimens.d6),
              Text(zipCode, style: AppTextStyles.locationDetail),
            ],
          ),
        ],
      ),
    );
  }
}
