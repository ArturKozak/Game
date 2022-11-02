import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';

class TopPanelTitle extends PageWidget {
  static const _fontSize = 16.0;

  const TopPanelTitle({super.key});

  @override
  Widget widgetBody(BuildContext context, Size size) {
    return const Padding(
      padding: EdgeInsets.all(AppConstants.smallPadding),
      child: Text(
        'sdasdsad dsadsad sadsadsa dsadsadsa sadsad sad',
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppColors.backgroundColor,
          fontSize: _fontSize,
          fontWeight: FontWeight.w800,
        ),
      ),
    );
  }
}
