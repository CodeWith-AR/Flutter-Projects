import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/massage_service_model.dart';
import '../viewmodels/massage_viewmodel.dart';

class CardImageSection extends StatelessWidget {
  final MassageServiceModel service;
  const CardImageSection({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    final activeIndex = context.select<MassageViewModel, int>(
      (vm) => vm.activeImageIndex,
    );

    return SizedBox(
      height: AppDimens.cardImageHeight,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: context.read<MassageViewModel>().onPageChanged,
            itemCount: service.imageUrls.isNotEmpty ? service.imageUrls.length : 1,
            itemBuilder: (_, __) => Image.asset(
              service.imageUrls.isNotEmpty
                  ? service.imageUrls.first
                  : AppAssets.massageWoman,
              fit: BoxFit.cover,
              width: double.infinity,
              errorBuilder: (_, __, ___) => Container(color: const Color(0xFFD4906A)),
            ),
          ),
          // Dot indicators
          Positioned(
            bottom: 46,
            left: 0, right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                service.imageUrls.isNotEmpty ? service.imageUrls.length : 4,
                (i) => _Dot(isActive: i == activeIndex),
              ),
            ),
          ),
          // Rating badge
          Positioned(
            bottom: AppDimens.d10, right: AppDimens.d10,
            child: _RatingBadge(rating: service.rating, count: service.reviewCount),
          ),
          // Favourite
          Positioned(
            top: AppDimens.d10, right: AppDimens.d10,
            child: GestureDetector(
              onTap: () => context.read<MassageViewModel>().toggleFavourite(service),
              child: Container(
                width: 32, height: 32,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  service.isFavourited
                      ? Icons.favorite_rounded
                      : Icons.favorite_border_rounded,
                  color: service.isFavourited ? AppColors.heartRed : Colors.white,
                  size: 16,
                ),
              ),
            ),
          ),
          // Provider avatar overlapping card body
          Positioned(
            bottom: -16, left: 14,
            child: Container(
              width: AppDimens.providerAvatarSize,
              height: AppDimens.providerAvatarSize,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.surface, width: 2.5),
              ),
              child: ClipOval(
                child: Image.asset(
                  service.providerAvatarUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: const Color(0xFFFDE8D8),
                    child: const Center(
                      child: Text('AR',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700,
                              color: Color(0xFFC06040))),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  final bool isActive;
  const _Dot({required this.isActive});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 2.5),
      width: isActive ? AppDimens.dotActiveWidth : AppDimens.dotSize,
      height: AppDimens.dotSize,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.white.withValues(alpha: 0.5),
        borderRadius: BorderRadius.circular(
          isActive ? AppDimens.dotRadius : AppDimens.dotSize / 2,
        ),
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  final double rating;
  final int count;
  const _RatingBadge({required this.rating, required this.count});

  @override
  Widget build(BuildContext context) {
    final label = count >= 1000 ? '${(count / 1000).toStringAsFixed(1)}k' : '$count';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.ratingBg,
        borderRadius: BorderRadius.circular(AppDimens.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.star_rounded, color: AppColors.starGold, size: 11),
          const SizedBox(width: AppDimens.d4),
          Text(rating.toStringAsFixed(1), style: AppTextStyles.ratingLabel),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 3),
            child: Text('·', style: AppTextStyles.ratingCount),
          ),
          Text(label, style: AppTextStyles.ratingCount),
        ],
      ),
    );
  }
}
