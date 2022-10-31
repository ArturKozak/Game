import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';

class BottomButtom extends PageWidget {
  static const _buttonHeight = 40.0;
  static const _buttonWidth = 110.0;
  static const _borderRadius = 16.0;

  final VoidCallback onTap;
  final String label;

  const BottomButtom({
    required this.onTap,
    required this.label,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context) {
    return Container(
      height: _buttonHeight,
      width: _buttonWidth,
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(_borderRadius),
        boxShadow: const [AppColors.darkShadow],
      ),
      child: TextButton(
        onPressed: onTap,
        child: Center(
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.activeColor,
            ),
          ),
        ),
      ),
    );
  }
}
