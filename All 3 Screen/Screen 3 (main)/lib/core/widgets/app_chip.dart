import 'package:flutter/material.dart';
import '../constants/app_dimens.dart';
import '../constants/app_text_styles.dart';

class AppChip extends StatelessWidget {
  final String label;
  final Color dotColor;
  final Color textColor;
  final Color borderColor;
  final Color bgColor;

  const AppChip({
    super.key,
    required this.label,
    required this.dotColor,
    required this.textColor,
    required this.borderColor,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(AppDimens.chipRadius),
        border: Border.all(color: borderColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 5, height: 5,
            decoration: BoxDecoration(color: dotColor, shape: BoxShape.circle),
          ),
          const SizedBox(width: AppDimens.d4),
          Text(label, style: AppTextStyles.chipLabel.copyWith(color: textColor)),
        ],
      ),
    );
  }
}
