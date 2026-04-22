import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class AppBottomNav extends StatelessWidget {
  const AppBottomNav({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  final int selectedIndex;
  final ValueChanged<int> onTap;

  static const _items = [
    _NavItem(label: 'Home',      icon: AppAssets.icHome),
    _NavItem(label: 'Shop',      icon: AppAssets.icShop),
    _NavItem(label: 'Bag',       icon: AppAssets.icBag),
    _NavItem(label: 'Favorites', icon: AppAssets.icFavs),
    _NavItem(label: 'Profile',   icon: AppAssets.icProfile),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.surface,
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_items.length, (i) {
          final active = i == selectedIndex;
          return GestureDetector(
            onTap: () => onTap(i),
            behavior: HitTestBehavior.opaque,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  _items[i].icon,
                  width: 24,
                  height: 24,
                  colorFilter: ColorFilter.mode(
                    active ? AppColors.navActive : AppColors.navInactive,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  _items[i].label,
                  style: AppTextStyles.navLabel.copyWith(
                    color: active ? AppColors.navActive : AppColors.navInactive,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class _NavItem {
  const _NavItem({required this.label, required this.icon});
  final String label;
  final String icon;
}
