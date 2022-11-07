import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/ui/common/hero_widget.dart';

class DetailsTitle extends PageWidget {
  static const _topPadding = 10.0;

  final String title;

  const DetailsTitle({
    required this.title,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context, Size size) {
    return Padding(
      padding: const EdgeInsets.only(
        top: _topPadding,
      ),
      child: HeroWidget(
        tag: title,
        child: Text(
          title,
          style: const TextStyle(
            color: AppColors.activeColor,
            fontSize: 26.0,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}
