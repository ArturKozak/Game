import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/chart/bar_chart_statistic.dart';

class MemeCardInfoPanel extends PageWidget {
  static const _cardHeight = 130.0;
  static const _sigma = 15.0;
  static const _borderRadius = 16.0;

  final MemeModel meme;

  const MemeCardInfoPanel({required this.meme, super.key});

  @override
  Widget widgetBody(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(_borderRadius),
          bottomRight: Radius.circular(_borderRadius),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: _sigma, sigmaY: _sigma),
          child: Container(
            height: _cardHeight,
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(_borderRadius),
                bottomRight: Radius.circular(_borderRadius),
              ),
              color: AppColors.backgroundColor,
            ),
            child: IgnorePointer(
              ignoring: true,
              child: BarChartStatistic(meme: meme),
            ),
          ),
        ),
      ),
    );
  }
}
