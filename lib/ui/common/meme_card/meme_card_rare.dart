import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_svg.dart';
import 'package:game/data/model/meme/meme_model.dart';

class MemeCardRare extends PageWidget {
  static const _commonKey = 'common';
  static const _uncommonKey = 'uncommon';
  static const _rareKey = 'rare';
  static const _epicKey = 'epic';
  static const _legendaryKey = 'legendary';

  static const _borderRadius = 25.0;
  static const _rarePadding = 5.0;
  static const _rareIconHeight = 50.0;
  static const _rareIconWidth = 60.0;
  static const _rareIconBottomPosition = 100.0;

  final MemeModel meme;

  const MemeCardRare({
    required this.meme,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context, Size size) {
    String rareIcon() {
      switch (meme.rare) {
        case _commonKey:
          return AppIcons.common;

        case _uncommonKey:
          return AppIcons.uncommon;
        case _rareKey:
          return AppIcons.rare;
        case _epicKey:
          return AppIcons.epic;
        case _legendaryKey:
          return AppIcons.legendary;

        default:
          return AppIcons.crystal;
      }
    }

    Color rareColor() {
      switch (meme.rare) {
        case _commonKey:
          return AppColors.commonColor;

        case _uncommonKey:
          return AppColors.unCommonColor;
        case _rareKey:
          return AppColors.rareColor;
        case _epicKey:
          return AppColors.epicColor;
        case _legendaryKey:
          return AppColors.legendaryColor;

        default:
          return AppColors.darkBackColor;
      }
    }

    return Positioned(
      right: 0,
      bottom: _rareIconBottomPosition,
      child: Container(
        height: _rareIconHeight,
        width: _rareIconWidth,
        padding: const EdgeInsetsDirectional.all(_rarePadding),
        decoration: const BoxDecoration(
          color: AppColors.darkBackColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(_borderRadius),
            bottomLeft: Radius.circular(_borderRadius),
          ),
        ),
        child: SvgPicture.asset(
          rareIcon(),
          color: rareColor(),
        ),
      ),
    );
  }
}
