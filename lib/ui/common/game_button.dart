import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';

class GameButton extends PageWidget {
  static const _verticalMargin = 20.0;
  static const _buttonHeight = 60.0;
  static const _buttonWidth = 200.0;

  final String title;

  const GameButton({
    required this.title,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context, Size size) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _verticalMargin),
      height: _buttonHeight,
      width: _buttonWidth,
      decoration: BoxDecoration(
        color: AppColors.activeColor,
        borderRadius: BorderRadius.circular(AppConstants.borderRadius),
      ),
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.darkBackColor,
          ),
        ),
      ),
    );
  }
}
