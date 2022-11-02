import 'package:flutter/material.dart';
import 'package:game/constants/app_colors.dart';

class GameScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return GlowingOverscrollIndicator(
      axisDirection: details.direction,
      color: AppColors.darkBackColor,
      child: child,
    );
  }
}
