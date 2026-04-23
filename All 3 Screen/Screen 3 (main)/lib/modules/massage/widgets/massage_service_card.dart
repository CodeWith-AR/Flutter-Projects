import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_chip.dart';
import '../../../data/models/massage_service_model.dart';
import '../viewmodels/massage_viewmodel.dart';
import 'card_image_section.dart';

class MassageServiceCard extends StatelessWidget {
  final MassageServiceModel service;
  const MassageServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppDimens.d16),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.cardRadius),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.09),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppDimens.cardRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardImageSection(service: service),
            Padding(
              padding: const EdgeInsets.only(
                left: AppDimens.cardBodyH,
                right: AppDimens.cardBodyH,
                top: AppDimens.cardBodyTop,
                bottom: AppDimens.cardBodyBottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(child: Text(service.providerName, style: AppTextStyles.providerName, overflow: TextOverflow.ellipsis)),
                      const SizedBox(width: AppDimens.d8),
                      if (service.offersHomeVisit)
                        const AppChip(
                          label: AppStrings.chipHomeVisit,
                          dotColor: AppColors.homeVisitDot,
                          textColor: AppColors.homeVisitText,
                          borderColor: AppColors.homeVisitBorder,
                          bgColor: AppColors.homeVisitBg,
                        ),
                      const SizedBox(width: AppDimens.d6),
                      if (service.offersAtProvider)
                        const AppChip(
                          label: AppStrings.chipAtProvider,
                          dotColor: AppColors.atProviderDot,
                          textColor: AppColors.atProviderText,
                          borderColor: AppColors.atProviderBorder,
                          bgColor: AppColors.atProviderBg,
                        ),
                    ],
                  ),
                  const SizedBox(height: AppDimens.d8),
                  Text(service.serviceTitle, style: AppTextStyles.serviceTitle),
                  const SizedBox(height: AppDimens.d6),
                  Text(service.serviceDescription,
                      style: AppTextStyles.serviceDesc,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: AppDimens.d12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _FooterItem(icon: Icons.monetization_on_outlined,
                          label: 'Starting \$${service.startingPrice.toInt()}'),
                      _FooterItem(icon: Icons.access_time_rounded,
                          label: '${service.durationMinutes} min ~'),
                      _FooterItem(icon: Icons.location_on_outlined,
                          label: service.location),
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

class _FooterItem extends StatelessWidget {
  final IconData icon;
  final String label;
  const _FooterItem({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: AppDimens.iconSm, color: AppColors.textMuted),
        const SizedBox(width: AppDimens.d4),
        Text(label, style: AppTextStyles.footerItem),
      ],
    );
  }
}
