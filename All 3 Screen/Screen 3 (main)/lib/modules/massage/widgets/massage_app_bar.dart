import 'package:flutter/material.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_dimens.dart';
import '../../../core/constants/app_strings.dart';
import '../../../core/constants/app_text_styles.dart';
import '../../../core/widgets/circle_icon_button.dart';

class MassageAppBar extends StatelessWidget {
  const MassageAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimens.appBarH,
        vertical: AppDimens.appBarV,
      ),
      child: Row(
        children: [
          CircleIconButton(
            icon: Icons.chevron_left_rounded,
            onTap: () => Navigator.of(context).maybePop(),
          ),
          const SizedBox(width: AppDimens.d12),
          const Expanded(
            child: Text(AppStrings.massageTitle, style: AppTextStyles.appBarTitle),
          ),
          CircleIconButton(icon: Icons.favorite_border_rounded, onTap: () {}),
          const SizedBox(width: AppDimens.d10),
          CircleIconButton(icon: Icons.notifications_none_rounded, onTap: () {}),
        ],
      ),
    );
  }
}
