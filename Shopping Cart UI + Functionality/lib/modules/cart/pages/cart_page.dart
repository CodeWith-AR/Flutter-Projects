import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../viewmodels/cart_view_model.dart';
import '../widgets/cart_item_card.dart';
import '../widgets/order_summary_card.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = context.select<CartViewModel, List>((vm) => vm.items);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // ── App Bar ────────────────────────────────────────────
            _CartAppBar(),

            // ── Scrollable content ────────────────────────────────
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  top: AppDimens.d8,
                  bottom: AppDimens.d24,
                ),
                children: [
                  // Cart items
                  ...items.map((item) => CartItemCard(item: item)),

                  const SizedBox(height: AppDimens.d8),

                  // Order Summary (live-computed inside widget)
                  const OrderSummaryCard(),
                ],
              ),
            ),

            // ── Checkout button ────────────────────────────────────
            _CheckoutButton(),
          ],
        ),
      ),
    );
  }
}

// ── App Bar ───────────────────────────────────────────────────────────────────
class _CartAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.pageH,
        vertical: AppDimens.d12,
      ),
      child: Row(
        children: [
          // Back button
          _CircleIconButton(
            onTap: () => Navigator.maybePop(context),
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              size: 18,
              color: AppColors.textPrimary,
            ),
          ),

          // Title
          const Expanded(
            child: Center(
              child: Text('Cart', style: AppTextStyles.appBarTitle),
            ),
          ),

          // More options button
          _CircleIconButton(
            onTap: () {},
            child: const Icon(
              Icons.more_vert_rounded,
              size: 22,
              color: AppColors.textPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Reusable circle icon button ───────────────────────────────────────────────
class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimens.appBarIconSize,
        height: AppDimens.appBarIconSize,
        decoration: const BoxDecoration(
          color: AppColors.iconCircleBg,
          shape: BoxShape.circle,
        ),
        child: Center(child: child),
      ),
    );
  }
}

// ── Checkout button ───────────────────────────────────────────────────────────
class _CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppDimens.pageH,
        AppDimens.d8,
        AppDimens.pageH,
        AppDimens.d16,
      ),
      child: GestureDetector(
        onTap: () {}, // navigate to checkout route
        child: Container(
          width: double.infinity,
          height: AppDimens.checkoutHeight,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AppColors.primary, AppColors.primaryDark],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(AppDimens.checkoutRadius),
          ),
          child: const Center(
            child: Text('Check Out', style: AppTextStyles.checkoutBtn),
          ),
        ),
      ),
    );
  }
}
