import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../viewmodels/massage_viewmodel.dart';

class MassageBottomBar extends StatelessWidget {
  const MassageBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.bottomBarBg,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.only(
            left: AppDimens.bottomBarH,
            right: AppDimens.bottomBarH,
            top: AppDimens.bottomBarTop,
            bottom: AppDimens.bottomBarBottom,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _BarBtn(
                icon: Icons.swap_vert_rounded,
                label: AppStrings.sortBy,
                onTap: () => _showSort(context),
              ),
              Container(width: 1, height: 22, color: AppColors.border),
              _BarBtn(
                icon: Icons.tune_rounded,
                label: AppStrings.filter,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showSort(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppDimens.radiusLg)),
      ),
      builder: (_) => const _SortSheet(),
    );
  }
}

class _BarBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _BarBtn({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: AppDimens.iconMd, color: AppColors.textPrimary),
          const SizedBox(width: AppDimens.d6),
          Text(label, style: AppTextStyles.bottomBarLabel),
        ],
      ),
    );
  }
}

class _SortSheet extends StatelessWidget {
  const _SortSheet();

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<MassageViewModel>().selectedSort;
    const opts = [
      (SortOption.recommended, 'Recommended'),
      (SortOption.priceLow, 'Price: Low to High'),
      (SortOption.priceHigh, 'Price: High to Low'),
      (SortOption.ratingHigh, 'Highest Rated'),
    ];
    return Padding(
      padding: const EdgeInsets.all(AppDimens.d24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(AppStrings.sortBy, style: AppTextStyles.heading3),
          const SizedBox(height: AppDimens.d16),
          ...opts.map((o) => ListTile(
                title: Text(o.$2, style: AppTextStyles.bodyMedium),
                trailing: selected == o.$1
                    ? const Icon(Icons.check_rounded, color: AppColors.primary)
                    : null,
                onTap: () {
                  context.read<MassageViewModel>().onSortChanged(o.$1);
                  Navigator.of(context).pop();
                },
              )),
        ],
      ),
    );
  }
}
