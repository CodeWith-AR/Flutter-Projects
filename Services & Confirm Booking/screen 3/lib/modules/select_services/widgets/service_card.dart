import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/service_model.dart';

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service});

  final ServiceModel service;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.cardMarginH,
        vertical: AppDimens.cardMarginV,
      ),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppDimens.cardRadius),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowColor,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.cardHPad,
          vertical: AppDimens.cardVPad,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ── Service image ──────────────────────────────────────
            ClipRRect(
              borderRadius: BorderRadius.circular(AppDimens.imageRadius),
              child: Image.asset(
                service.imagePath,
                width: AppDimens.imageSize,
                height: AppDimens.imageSize,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: AppDimens.imageSize,
                    height: AppDimens.imageSize,
                    color: AppColors.appBarLeadBg,
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),

            const SizedBox(width: AppDimens.d12),

            // ── Info column ────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Title
                  Text(
                    service.title,
                    style: AppTextStyles.serviceTitle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  const SizedBox(height: AppDimens.d8),

                  // Metadata row
                  Row(
                    children: [
                      // Price
                      Text(
                        '${service.currency} ${service.price.toInt()}',
                        style: AppTextStyles.metaText,
                      ),

                      const SizedBox(width: AppDimens.d10),

                      // Clock icon + duration
                      SvgPicture.asset(
                        AppAssets.clock,
                        width: AppDimens.metaIconSize,
                        height: AppDimens.metaIconSize,
                        colorFilter: const ColorFilter.mode(
                          AppColors.textMeta,
                          BlendMode.srcIn,
                        ),
                      ),
                      const SizedBox(width: AppDimens.d2),
                      Text(
                        '${service.durationMinutes} min ~',
                        style: AppTextStyles.metaText,
                      ),

                      const Spacer(),

                      // Home visit chip
                      _HomeVisitChip(label: service.visitType),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Home visit chip — private to this widget file ─────────────────────────────
class _HomeVisitChip extends StatelessWidget {
  const _HomeVisitChip({required this.label});

  final String label;

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
        border: Border.all(
          color: AppColors.chipGreen,
          width: AppDimens.chipBorderWidth,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppAssets.home,
            width: AppDimens.chipIconSize,
            height: AppDimens.chipIconSize,
            colorFilter: const ColorFilter.mode(
              AppColors.chipGreen,
              BlendMode.srcIn,
            ),
          ),
          const SizedBox(width: AppDimens.d4),
          Text(label, style: AppTextStyles.chipLabel),
        ],
      ),
    );
  }
}
