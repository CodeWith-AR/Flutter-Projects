import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../viewmodels/massage_viewmodel.dart';

class MassageSearchBar extends StatelessWidget {
  const MassageSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: AppDimens.searchWrapH,
        right: AppDimens.searchWrapH,
        bottom: AppDimens.searchWrapBottom,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimens.searchBarH,
          vertical: AppDimens.searchBarV,
        ),
        decoration: BoxDecoration(
          color: AppColors.surface,
          borderRadius: BorderRadius.circular(AppDimens.searchBarRadius),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.08),
              blurRadius: 12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const Icon(
              Icons.search_rounded,
              color: AppColors.searchIcon,
              size: AppDimens.iconMd,
            ),
            const SizedBox(width: AppDimens.d10),
            Expanded(
              child: TextField(
                onChanged: (v) => context.read<MassageViewModel>().onSearchChanged(v),
                style: AppTextStyles.bodyMedium,
                decoration: const InputDecoration(
                  hintText: AppStrings.searchHint,
                  hintStyle: AppTextStyles.searchHint,
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
