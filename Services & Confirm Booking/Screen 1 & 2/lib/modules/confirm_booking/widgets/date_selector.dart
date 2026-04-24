import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../data/models/booking_models.dart';

class DateSelector extends StatelessWidget {
  const DateSelector({
    super.key,
    required this.dates,
    required this.selectedIndex,
    required this.onSelect,
  });

  final List<BookingDateModel> dates;
  final int selectedIndex;
  final ValueChanged<int> onSelect;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.dateItemH,
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(color: Color(0xFFFCE4F3), width: 1),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dates.length,
        itemBuilder: (_, i) {
          final active = i == selectedIndex;
          final d = dates[i];
          final fgColor = active
              ? AppColors.dateActiveText
              : AppColors.textPrimary.withOpacity(0.7);

          return GestureDetector(
            onTap: () => onSelect(i),
            child: Container(
              width: MediaQuery.of(context).size.width / 7.2, // Fit 7 items better
              decoration: BoxDecoration(
                color: active ? AppColors.dateActiveBg : Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    d.dayAbbr,
                    style: AppTextStyles.dateDayAbbr.copyWith(
                      color: fgColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${d.date}',
                    style: AppTextStyles.dateNumber.copyWith(
                      color: fgColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    d.monthAbbr,
                    style: AppTextStyles.dateMonthAbbr.copyWith(
                      color: fgColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
