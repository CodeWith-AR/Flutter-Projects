import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';

class BookingTabBar extends StatelessWidget {
  const BookingTabBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const _tabs = ['Home Visit', 'At Provider'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: List.generate(_tabs.length, (i) {
            final active = i == selectedIndex;
            return Expanded(
              child: GestureDetector(
                onTap: () => onTap(i),
                behavior: HitTestBehavior.opaque,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: AppDimens.d10),
                      child: Text(
                        _tabs[i],
                        style: active
                            ? AppTextStyles.tabActive
                            : AppTextStyles.tabInactive,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    // Per-tab indicator — only shown when active
                    Container(
                      height: AppDimens.d2,
                      color: active
                          ? AppColors.tabIndicator
                          : AppColors.divider,
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
