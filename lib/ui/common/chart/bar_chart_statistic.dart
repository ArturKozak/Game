import 'package:flutter/material.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/chart/radial_gauge_statistic_item.dart';

class BarChartStatistic extends StatelessWidget {
  final MemeModel meme;

  const BarChartStatistic({required this.meme, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        RadialGaugeStatisticItem(
          point: 'Strange',
          stat: meme.strange,
          color: AppColors.firstLightColor,
        ),
        RadialGaugeStatisticItem(
          point: 'Lucky',
          stat: meme.lucky,
          color: AppColors.secondLightColor,
        ),
        RadialGaugeStatisticItem(
          point: 'Smile',
          stat: meme.smile,
          color: AppColors.threeLightColor,
        ),
      ],
    );
  }
}
