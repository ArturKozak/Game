import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';

class SellButton extends PageWidget {
  static const _verticalMargin = 20.0;
  static const _buttonHeight = 60.0;
  static const _buttonWidth = 200.0;

  const SellButton({super.key});

  @override
  Widget widgetBody(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: _verticalMargin),
      height: _buttonHeight,
      width: _buttonWidth,
      decoration: BoxDecoration(
        color: AppColors.activeColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Text(
          'Sell meme',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppColors.darkBackColor,
          ),
        ),
      ),
    );
  }
}
