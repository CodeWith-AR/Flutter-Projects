import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../viewmodels/confirm_booking_view_model.dart';
import '../widgets/booking_tab_bar.dart';
import '../widgets/date_selector.dart';
import '../widgets/location_card.dart';
import '../widgets/service_summary_card.dart';
import '../widgets/time_slot_grid.dart';

class ConfirmBookingPage extends StatelessWidget {
  const ConfirmBookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<ConfirmBookingViewModel>();

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          // ── Scrollable content ─────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppDimens.pageH,
                vertical: AppDimens.d16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // ── Select Services ──────────────────────────────
                  _SectionRow(label: 'Select Services', actionLabel: 'Change', onAction: () {}),
                  const SizedBox(height: AppDimens.d10),
                  ServiceSummaryCard(
                    title: vm.serviceName,
                    price: vm.servicePrice,
                    durationMinutes: vm.serviceDuration,
                  ),

                  const SizedBox(height: AppDimens.d20),

                  // ── Tab bar ───────────────────────────────────────
                  BookingTabBar(
                    selectedIndex: vm.selectedTabIndex,
                    onTap: (i) => context.read<ConfirmBookingViewModel>().selectTab(i),
                  ),

                  const SizedBox(height: AppDimens.d20),

                  // ── Select Date ───────────────────────────────────
                  const Text('Select Date', style: AppTextStyles.sectionLabel),
                  const SizedBox(height: AppDimens.d12),
                  DateSelector(
                    dates: vm.dates,
                    selectedIndex: vm.selectedDateIndex,
                    onSelect: (i) => context.read<ConfirmBookingViewModel>().selectDate(i),
                  ),

                  const SizedBox(height: AppDimens.d20),

                  // ── Select Time Slot ──────────────────────────────
                  const Text('Select Time Slot', style: AppTextStyles.sectionLabel),
                  const SizedBox(height: AppDimens.d12),
                  TimeSlotGrid(
                    slots: vm.timeSlots,
                    selectedSlot: vm.selectedTimeSlot,
                    onSelect: (s) => context.read<ConfirmBookingViewModel>().selectTime(s),
                  ),

                  const SizedBox(height: AppDimens.d20),

                  // ── Prices ────────────────────────────────────────
                  const Text('Prices', style: AppTextStyles.sectionLabel),
                  const SizedBox(height: AppDimens.d12),
                  _PricesCard(price: vm.totalPrice),

                  const SizedBox(height: AppDimens.d20),

                  // ── Your Location ─────────────────────────────────
                  const Text('Your Location', style: AppTextStyles.sectionLabel),
                  const SizedBox(height: AppDimens.d12),
                  LocationCard(
                    city: vm.locationCity,
                    address: vm.locationAddress,
                    zipCode: vm.locationZip,
                    onEdit: () {},
                  ),

                  const SizedBox(height: AppDimens.d24),
                ],
              ),
            ),
          ),

          // ── Bottom action buttons ───────────────────────────────
          const _BottomButtons(),
        ],
      ),
    );
  }

  // ── AppBar ──────────────────────────────────────────────────────────────────
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.scaffold,
      elevation: 0,
      scrolledUnderElevation: 0,
      titleSpacing: AppDimens.d8,
      leading: Padding(
        padding: const EdgeInsets.only(left: AppDimens.d16),
        child: SvgPicture.asset(
          AppAssets.logo,
          width: AppDimens.logoSize,
          height: AppDimens.logoSize,
          fit: BoxFit.contain,
          placeholderBuilder: (_) => const Icon(
            Icons.pregnant_woman_rounded,
            color: AppColors.primary,
            size: AppDimens.logoSize,
          ),
        ),
      ),
      title: const Text('Confirm your Booking', style: AppTextStyles.appBarTitle),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.fav,
              width: AppDimens.appIconSz, height: AppDimens.appIconSz,
              colorFilter: const ColorFilter.mode(AppColors.appBarIcon, BlendMode.srcIn),
              placeholderBuilder: (_) =>
                  const Icon(Icons.favorite_border_rounded, size: AppDimens.appIconSz)),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(AppAssets.notification,
              width: AppDimens.appIconSz, height: AppDimens.appIconSz,
              colorFilter: const ColorFilter.mode(AppColors.appBarIcon, BlendMode.srcIn),
              placeholderBuilder: (_) =>
                  const Icon(Icons.notifications_none_rounded, size: AppDimens.appIconSz)),
        ),
        const SizedBox(width: AppDimens.d8),
      ],
    );
  }
}

// ── Section header row ─────────────────────────────────────────────────────────
class _SectionRow extends StatelessWidget {
  const _SectionRow({
    required this.label,
    required this.actionLabel,
    required this.onAction,
  });

  final String label;
  final String actionLabel;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: AppTextStyles.sectionLabel),
        const Spacer(),
        GestureDetector(
          onTap: onAction,
          child: Text(actionLabel, style: AppTextStyles.changeLink),
        ),
      ],
    );
  }
}

// ── Prices card ────────────────────────────────────────────────────────────────
class _PricesCard extends StatelessWidget {
  const _PricesCard({required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.d16,
        vertical: AppDimens.d14,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimens.radiusMd),
        border: Border.all(color: AppColors.cardBorder, width: AppDimens.cardBorderW),
      ),
      child: Text(price, style: AppTextStyles.priceValue),
    );
  }
}

// ── Bottom action buttons ──────────────────────────────────────────────────────
class _BottomButtons extends StatelessWidget {
  const _BottomButtons();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(
        AppDimens.pageH,
        AppDimens.d12,
        AppDimens.pageH,
        MediaQuery.of(context).padding.bottom + AppDimens.d12,
      ),
      decoration: const BoxDecoration(
        color: AppColors.scaffold,
        border: Border(top: BorderSide(color: AppColors.divider)),
      ),
      child: Row(
        children: [
          // Cancel
          Expanded(
            child: SizedBox(
              height: AppDimens.btnH,
              child: OutlinedButton(
                onPressed: () => Navigator.maybePop(context),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.borderDark, width: AppDimens.cardBorderW),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimens.btnRadius),
                  ),
                  backgroundColor: AppColors.surface,
                ),
                child: const Text('Cancel', style: AppTextStyles.btnCancel),
              ),
            ),
          ),

          const SizedBox(width: AppDimens.btnGap),

          // Confirm Booking
          Expanded(
            child: SizedBox(
              height: AppDimens.btnH,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppDimens.btnRadius),
                  ),
                ),
                child: const Text('Confirm Booking', style: AppTextStyles.btnConfirm),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
