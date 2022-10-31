import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/ui/common/chart/radial_gauge_statistic_item.dart';

class DetailsGaugeInfoItem extends PageWidget {
  static const _borderRadius = 16.0;
  static const _padding = 5.0;
  static const _iconSize = 30.0;

  final IconData icon;
  final String stat;
  final double point;
  final Color color;

  const DetailsGaugeInfoItem({
    required this.icon,
    required this.stat,
    required this.point,
    required this.color,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: AppColors.backgroundColor,
        boxShadow: const [AppColors.darkShadow],
      ),
      child: Column(
        children: [
          Icon(
            icon,
            color: color,
            size: _iconSize,
          ),
          Text(
            stat,
            style: TextStyle(
              color: color,
              fontSize: 16.0,
              fontWeight: FontWeight.w900,
            ),
          ),
          RadialGaugeStatisticItem(
            stat: point,
            color: color,
            enableLoadingAnimation: true,
          ),
        ],
      ),
    );
  }
}
