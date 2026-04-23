import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_dimens.dart';

class CircleIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final double? iconSize;

  const CircleIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.iconSize,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: AppDimens.iconBtnSize,
        height: AppDimens.iconBtnSize,
        decoration: BoxDecoration(
          color: AppColors.iconCircleBg,
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.iconCircleBorder, width: 1.5),
        ),
        child: Icon(icon,
            color: AppColors.textPrimary,
            size: iconSize ?? AppDimens.iconMd),
      ),
    );
  }
}
