import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../viewmodels/select_services_view_model.dart';
import '../widgets/service_card.dart';

class SelectServicesPage extends StatelessWidget {
  const SelectServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final services = context.select<SelectServicesViewModel, List>(
      (vm) => vm.services,
    );

    return Scaffold(
      backgroundColor: AppColors.transparent,
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(context),
      body: Container(
        // Full-screen gradient
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColors.gradientTop, AppColors.gradientBottom],
          ),
        ),
        child: SafeArea(
          child: ListView.builder(
            padding: const EdgeInsets.only(
              top: AppDimens.pageTop,
              bottom: AppDimens.pageBottom,
            ),
            itemCount: services.length,
            itemBuilder: (_, i) => ServiceCard(service: services[i]),
          ),
        ),
      ),
    );
  }

  // ── AppBar ──────────────────────────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: AppDimens.d8,
      leading: Padding(
        padding: const EdgeInsets.only(left: AppDimens.d16),
        child: Center(
          child: _LeadingButton(onTap: () => Navigator.maybePop(context)),
        ),
      ),
      title: Text('Select Services', style: AppTextStyles.appBarTitle),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.fav,
            width: AppDimens.appBarIconSize,
            height: AppDimens.appBarIconSize,
            colorFilter: const ColorFilter.mode(
              AppColors.appBarIcon,
              BlendMode.srcIn,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            AppAssets.notification,
            width: AppDimens.appBarIconSize,
            height: AppDimens.appBarIconSize,
            colorFilter: const ColorFilter.mode(
              AppColors.appBarIcon,
              BlendMode.srcIn,
            ),
          ),
        ),
        const SizedBox(width: AppDimens.d4),
      ],
    );
  }
}

// ── Circular back button — private to this page ───────────────────────────────
class _LeadingButton extends StatelessWidget {
  const _LeadingButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimens.appBarLeadSize,
        height: AppDimens.appBarLeadSize,
        decoration: const BoxDecoration(
          color: AppColors.appBarLeadBg,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.chevron_left_rounded,
          color: AppColors.appBarIcon,
          size: 22,
        ),
      ),
    );
  }
}
