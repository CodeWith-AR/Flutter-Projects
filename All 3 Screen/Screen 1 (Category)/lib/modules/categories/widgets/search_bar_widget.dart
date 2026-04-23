import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_text_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppDimens.searchHeight,
      decoration: BoxDecoration(
        color: AppColors.searchBg,
        borderRadius: BorderRadius.circular(AppDimens.searchRadius),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.searchHPad),
      child: Row(
        children: [
          const Icon(
            Icons.search_rounded,
            color: AppColors.searchIcon,
            size: 22,
          ),
          const SizedBox(width: AppDimens.d8),
          Expanded(
            child: TextField(
              onChanged: onChanged,
              style: AppTextStyles.searchHint.copyWith(
                color: AppColors.appBarTitle,
              ),
              decoration: const InputDecoration(
                hintText: 'What are you looking for?',
                hintStyle: AppTextStyles.searchHint,
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsets.zero,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
