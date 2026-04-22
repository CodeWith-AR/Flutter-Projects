import 'package:flutter/material.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({
    super.key,
    required this.title,
    required this.subtitle,
    this.onViewAll,
  });

  final String title;
  final String subtitle;
  final VoidCallback? onViewAll;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.pageHPadding),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: AppTextStyles.sectionTitle),
              Text(subtitle, style: AppTextStyles.sectionSubtitle),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: onViewAll,
            child: const Padding(
              padding: EdgeInsets.only(top: AppDimens.d4),
              child: Text('View all', style: AppTextStyles.viewAll),
            ),
          ),
        ],
      ),
    );
  }
}
