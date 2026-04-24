import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';

class TimeSlotGrid extends StatelessWidget {
  const TimeSlotGrid({
    super.key,
    required this.slots,
    required this.selectedSlot,
    required this.onSelect,
  });

  final List<String> slots;
  final String selectedSlot;
  final ValueChanged<String> onSelect;

  @override
  Widget build(BuildContext context) {
    // Split into rows of 3
    final rows = <List<String>>[];
    for (var i = 0; i < slots.length; i += 3) {
      rows.add(slots.sublist(i, i + 3 > slots.length ? slots.length : i + 3));
    }

    return Column(
      children: rows.map((row) {
        return Padding(
          padding: const EdgeInsets.only(bottom: AppDimens.d10),
          child: Row(
            children: row.map((slot) {
              final active = slot == selectedSlot;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: slot != row.last ? AppDimens.d8 : 0,
                  ),
                  child: GestureDetector(
                    onTap: () => onSelect(slot),
                    child: Container(
                      height: AppDimens.timePillH,
                      decoration: BoxDecoration(
                        color: active
                            ? AppColors.timeActiveBg
                            : AppColors.surface,
                        borderRadius: BorderRadius.circular(AppDimens.timePillR),
                        border: active
                            ? null
                            : Border.all(
                                color: AppColors.timeBorder,
                                width: AppDimens.timeBorderW,
                              ),
                      ),
                      child: Center(
                        child: Text(
                          slot,
                          style: active
                              ? AppTextStyles.timeSlotActive
                              : AppTextStyles.timeSlotInactive,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        );
      }).toList(),
    );
  }
}
