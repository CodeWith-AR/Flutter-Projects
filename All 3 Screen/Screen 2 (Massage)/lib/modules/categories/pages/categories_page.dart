import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../viewmodels/categories_view_model.dart';
import '../widgets/category_card.dart';
import '../widgets/search_bar_widget.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,

      appBar: _buildAppBar(context),

      body: SafeArea(
        child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.pageH,
              vertical: AppDimens.pageV,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: AppDimens.d8),

                // ── Search bar ──────────────────────────────────────
                SearchBarWidget(
                  onChanged: (q) =>
                      context.read<CategoriesViewModel>().setQuery(q),
                ),

                const SizedBox(height: AppDimens.d16),

                // ── Category grid ───────────────────────────────────
                _CategoryGrid(),
              ],
            ),
          ),
        ),
    );
  }

  // ── AppBar — transparent, no elevation ─────────────────────────────────────
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: 0,

      // Back button inside grey circle
      leading: Padding(
        padding: const EdgeInsets.only(left: AppDimens.d16),
        child: Center(
          child: _CircleIconBtn(
            onTap: () => Navigator.maybePop(context),
            child: const Icon(
              Icons.chevron_left,
              color: AppColors.appBarIcon,
              size: 22,
            ),
          ),
        ),
      ),

      centerTitle: true,
      title: const Text('Massage', style: AppTextStyles.appBarTitle),

      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.favorite_border_rounded,
            color: AppColors.appBarIcon,
            size: 24,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.notifications_none_rounded,
            color: AppColors.appBarIcon,
            size: 24,
          ),
        ),
        const SizedBox(width: AppDimens.d4),
      ],
    );
  }
}

// ── Category grid — reads filtered list from VM ───────────────────────────────
class _CategoryGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categories =
        context.select<CategoriesViewModel, List>((vm) => vm.categories);

    if (categories.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.only(top: 48),
          child: Text(
            'No categories found',
            style: AppTextStyles.searchHint,
          ),
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: AppDimens.gridCrossSpacing,
        mainAxisSpacing: AppDimens.gridMainSpacing,
        childAspectRatio: 0.70, // adjusted to allow more vertical space for icon and text
      ),
      itemCount: categories.length,
      itemBuilder: (_, i) => CategoryCard(category: categories[i]),
    );
  }
}

// ── Reusable appbar circle icon button ────────────────────────────────────────
class _CircleIconBtn extends StatelessWidget {
  const _CircleIconBtn({required this.child, required this.onTap});

  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimens.appBarLeaderSize,
        height: AppDimens.appBarLeaderSize,
        decoration: const BoxDecoration(
          color: AppColors.appBarLeaderBg,
          shape: BoxShape.circle,
        ),
        child: Center(child: child),
      ),
    );
  }
}
