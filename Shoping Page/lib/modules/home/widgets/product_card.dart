import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppDimens.productCardW,
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.cardRadius),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          SizedBox(
            height: AppDimens.productImgH,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(AppDimens.cardRadius),
                  ),
                  child: Image.asset(
                    product.imagePath,
                    width: double.infinity,
                    height: AppDimens.productImgH,
                    fit: BoxFit.cover,
                  ),
                ),

                // Discount badge
                if (product.discountLabel != null)
                  Positioned(
                    top: AppDimens.d8,
                    left: AppDimens.d8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.d8,
                        vertical: AppDimens.d4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.badgeRed,
                        borderRadius: BorderRadius.circular(AppDimens.badgeRadius),
                      ),
                      child: Text(product.discountLabel!, style: AppTextStyles.badge),
                    ),
                  ),

                // NEW Badge
                if (product.isNew)
                  Positioned(
                    top: AppDimens.d8,
                    left: AppDimens.d8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppDimens.d8,
                        vertical: AppDimens.d4,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.textPrimary,
                        borderRadius: BorderRadius.circular(AppDimens.badgeRadius),
                      ),
                      child: const Text('NEW', style: AppTextStyles.badge),
                    ),
                  ),

                // Fav btn
                Positioned(
                  bottom: AppDimens.d8,
                  right: AppDimens.d8,
                  child: Container(
                    width: AppDimens.heartSize,
                    height: AppDimens.heartSize,
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppColors.heartBorder),
                    ),
                    child: const Icon(
                      Icons.favorite_border_rounded,
                      size: 16,
                      color: AppColors.navInactive,
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(AppDimens.d8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Rating ROw Using Star
                Row(
                  children: [
                    SvgPicture.asset(AppAssets.icStar, width: 12, height: 12),
                    SvgPicture.asset(AppAssets.icStar, width: 12, height: 12),
                    SvgPicture.asset(AppAssets.icStar, width: 12, height: 12),
                    SvgPicture.asset(AppAssets.icStar, width: 12, height: 12),
                    SvgPicture.asset(AppAssets.icStar, width: 12, height: 12),
                    const SizedBox(width: AppDimens.d4),
                    Text('(${product.reviewCount})', style: AppTextStyles.ratingCount),
                  ],
                ),

                const SizedBox(height: AppDimens.d4),
                Text(product.brand, style: AppTextStyles.cardBrand),
                Text(product.name, style: AppTextStyles.cardName),
                const SizedBox(height: AppDimens.d4),

                // Price Row
                Row(
                  children: [
                    if (product.oldPrice > 0) ...[
                      Text('${product.oldPrice.toInt()}\$', style: AppTextStyles.priceOld),
                      const SizedBox(width: AppDimens.d4),
                    ],
                    Text('${product.newPrice.toInt()}\$', style: AppTextStyles.priceNew),
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
