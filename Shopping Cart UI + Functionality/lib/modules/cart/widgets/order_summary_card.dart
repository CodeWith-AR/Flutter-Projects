import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../viewmodels/cart_view_model.dart';

class OrderSummaryCard extends StatelessWidget {
  const OrderSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Narrow selects — only rebuilds when these values change
    final itemCount       = context.select<CartViewModel, int>((vm) => vm.itemCount);
    final subtotal        = context.select<CartViewModel, double>((vm) => vm.subtotal);
    final discount        = context.select<CartViewModel, double>((vm) => vm.discount);
    final deliveryCharges = context.select<CartViewModel, double>((vm) => vm.deliveryCharges);
    final total           = context.select<CartViewModel, double>((vm) => vm.total);

    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimens.pageH,
        vertical: AppDimens.d8,
      ),
      padding: const EdgeInsets.all(AppDimens.d16),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(AppDimens.cartCardRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Order Summary', style: AppTextStyles.summaryTitle),
          const SizedBox(height: AppDimens.d16),

          _SummaryRow(label: 'Items',            value: itemCount.toString()),
          const SizedBox(height: AppDimens.d12),
          _SummaryRow(label: 'Subtotal',         value: '\$${subtotal.toStringAsFixed(0)}'),
          const SizedBox(height: AppDimens.d12),
          _SummaryRow(label: 'Discount',         value: '\$${discount.toStringAsFixed(0)}'),
          const SizedBox(height: AppDimens.d12),
          _SummaryRow(label: 'Delivery Charges', value: '\$${deliveryCharges.toStringAsFixed(0)}'),

          const SizedBox(height: AppDimens.d16),
          const Divider(color: AppColors.divider, thickness: 1, height: 1),
          const SizedBox(height: AppDimens.d16),

          // Total row — bold
          Row(
            children: [
              const Text('Total', style: AppTextStyles.totalLabel),
              const Spacer(),
              Text('\$${total.toStringAsFixed(0)}', style: AppTextStyles.totalValue),
            ],
          ),
        ],
      ),
    );
  }
}

// ── Single summary row ────────────────────────────────────────────────────────
class _SummaryRow extends StatelessWidget {
  const _SummaryRow({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppTextStyles.summaryLabel),
        const Spacer(),
        Text(value, style: AppTextStyles.summaryValue),
      ],
    );
  }
}
