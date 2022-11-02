import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/chart/details/details_gauge_info_item.dart';

class DetailsBarChartStatistic extends PageWidget {
  final MemeModel meme;

  const DetailsBarChartStatistic({required this.meme, super.key});

  @override
  Widget widgetBody(BuildContext context, Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DetailsGaugeInfoItem(
          icon: Icons.favorite_rounded,
          stat: 'Strange',
          point: meme.strange,
          color: AppColors.firstLightColor,
        ),
        DetailsGaugeInfoItem(
          icon: Icons.star_rate_rounded,
          stat: 'Lucky',
          point: meme.lucky,
          color: AppColors.secondLightColor,
        ),
        DetailsGaugeInfoItem(
          icon: Icons.tag_faces_rounded,
          stat: 'Smile',
          point: meme.smile,
          color: AppColors.threeLightColor,
        ),
      ],
    );
  }
}
