import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';

class NewGameButton extends PageWidget {
  static const _elevation = 5.0;
  static const _minimumSize = Size(200, 50);

  final Color backgroundColor;
  final VoidCallback onTap;
  final String title;

  const NewGameButton({
    required this.backgroundColor,
    required this.title,
    required this.onTap,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context, Size size) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        minimumSize: _minimumSize,
        elevation: _elevation,
        backgroundColor: backgroundColor,
        surfaceTintColor: AppColors.darkBackColor,
        foregroundColor: AppColors.darkBackColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(AppConstants.borderRadius),
          ),
        ),
      ),
      child: Text(
        title,
        style: const TextStyle(
          color: AppColors.darkBackColor,
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}
