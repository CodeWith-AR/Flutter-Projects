import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';

class ServiceSummaryCard extends StatelessWidget {
  const ServiceSummaryCard({
    super.key,
    required this.title,
    required this.price,
    required this.durationMinutes,
  });

  final String title;
  final String price;
  final int durationMinutes;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDimens.d12),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        border: Border.all(color: AppColors.cardBorder, width: AppDimens.cardBorderW),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.serviceImgRadius),
            child: Image.asset(
              AppAssets.woman,
              width: AppDimens.serviceImgSize,
              height: AppDimens.serviceImgSize,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: AppDimens.d12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(title,
                    style: AppTextStyles.serviceTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                const SizedBox(height: AppDimens.d8),
                Row(
                  children: [
                    Text(price, style: AppTextStyles.metaText),
                    const SizedBox(width: AppDimens.d8),
                    SvgPicture.asset(AppAssets.clock,
                        width: AppDimens.d12, height: AppDimens.d12,
                        colorFilter: const ColorFilter.mode(AppColors.textSecondary, BlendMode.srcIn)),
                    const SizedBox(width: AppDimens.d4),
                    Text('$durationMinutes min ~', style: AppTextStyles.metaText),
                    const Spacer(),
                    const _HomeVisitChip(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeVisitChip extends StatelessWidget {
  const _HomeVisitChip();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.chipHPad,
        vertical: AppDimens.chipVPad,
      ),
      decoration: BoxDecoration(
        color: AppColors.chipGreenBg,
        borderRadius: BorderRadius.circular(AppDimens.chipRadius),
        border: Border.all(color: AppColors.chipGreen, width: AppDimens.chipBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(AppAssets.home,
              width: AppDimens.chipIconSz,
              height: AppDimens.chipIconSz,
              colorFilter: const ColorFilter.mode(AppColors.chipGreen, BlendMode.srcIn)),
          const SizedBox(width: AppDimens.d4),
          const Text('Home visit', style: AppTextStyles.chipLabel),
        ],
      ),
    );
  }
}
