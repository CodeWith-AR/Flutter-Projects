import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/app_bottom_nav.dart';
import '../viewmodels/home_view_model.dart';
import '../widgets/horizontal_product_list.dart';
import '../widgets/section_header.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Expanded(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _HeroBanner()),

                const SliverToBoxAdapter(child: SizedBox(height: AppDimens.d24)),

                const SliverToBoxAdapter(
                  child: SectionHeader(
                    title: 'Sale',
                    subtitle: 'Super summer sale',
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: AppDimens.d12)),
                SliverToBoxAdapter(
                  child: HorizontalProductList(products: vm.saleProducts),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: AppDimens.d24)),

                const SliverToBoxAdapter(
                  child: SectionHeader(
                    title: 'New',
                    subtitle: "You've never seen it before!",
                  ),
                ),
                const SliverToBoxAdapter(child: SizedBox(height: AppDimens.d12)),
                SliverToBoxAdapter(
                  child: HorizontalProductList(products: vm.newProducts),
                ),

                const SliverToBoxAdapter(child: SizedBox(height: AppDimens.d24)),
              ],
            ),
          ),

          AppBottomNav(
            selectedIndex: vm.selectedNavIndex,
            onTap: (i) => context.read<HomeViewModel>().setNavIndex(i),
          ),
        ],
      ),
    );
  }
}


class _HeroBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppAssets.imgMain,
          height: AppDimens.heroBannerH,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Positioned(
          bottom: AppDimens.d20,
          left: AppDimens.pageHPadding,
          child: const Text('Street clothes', style: AppTextStyles.heroBanner),
        ),
      ],
    );
  }
}
