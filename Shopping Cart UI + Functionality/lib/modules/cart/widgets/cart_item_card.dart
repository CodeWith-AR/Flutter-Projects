import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/cart_item_model.dart';
import '../viewmodels/cart_view_model.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({super.key, required this.item});

  final CartItemModel item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.pageH,
        vertical: AppDimens.d8,
      ),
      padding: const EdgeInsets.all(AppDimens.cartCardPadding),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppDimens.cartCardRadius),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // ── Product image ─────────────────────────────────────────
          ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.radiusSm),
            child: Image.asset(
              item.imagePath,
              width: AppDimens.cartImageSize,
              height: AppDimens.cartImageSize,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: AppDimens.d12),

          // ── Info + controls ───────────────────────────────────────
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name row + delete icon
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(item.name, style: AppTextStyles.itemName),
                    ),
                    // Delete button
                    GestureDetector(
                      onTap: () => context.read<CartViewModel>().remove(item.id),
                      child: const Icon(
                        Icons.delete_outline_rounded,
                        color: AppColors.deleteIcon,
                        size: 24,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: AppDimens.d4),
                Text(item.brand, style: AppTextStyles.itemBrand),
                const SizedBox(height: AppDimens.d8),

                // Price row + qty controls
                Row(
                  children: [
                    Text(
                      '\$${item.unitPrice.toInt()}',
                      style: AppTextStyles.itemPrice,
                    ),
                    const Spacer(),
                    _QtyButton(
                      icon: Icons.remove,
                      onTap: () => context.read<CartViewModel>().decrement(item.id),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: AppDimens.d12),
                      child: Text(
                        item.quantity.toString().padLeft(2, '0'),
                        style: AppTextStyles.qtyNumber,
                      ),
                    ),
                    _QtyButton(
                      icon: Icons.add,
                      onTap: () => context.read<CartViewModel>().increment(item.id),
                    ),
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

// ── Private qty button — only used in CartItemCard ────────────────────────────
class _QtyButton extends StatelessWidget {
  const _QtyButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimens.qtyBtnSize,
        height: AppDimens.qtyBtnSize,
        decoration: const BoxDecoration(
          color: AppColors.qtyButtonBg,
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: AppColors.qtyIcon, size: AppDimens.qtyIconSize),
      ),
    );
  }
}
