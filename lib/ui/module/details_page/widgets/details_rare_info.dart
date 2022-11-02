import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_svg.dart';
import 'package:game/data/model/meme/meme_model.dart';

class DetailsRareInfo extends PageWidget {
  static const _commonKey = 'common';
  static const _uncommonKey = 'uncommon';
  static const _rareKey = 'rare';
  static const _epicKey = 'epic';
  static const _legendaryKey = 'legendary';

  static const _borderRadius = 25.0;
  static const _rarePadding = 5.0;
  static const _rarePanelHeight = 40.0;
  static const _rarePanelWidth = 150.0;
  static const _svgSize = 40.0;

  final MemeModel meme;

  const DetailsRareInfo({
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

    String rareTitle() {
      switch (meme.rare) {
        case _commonKey:
          return 'Common';

        case _uncommonKey:
          return 'Uncommon';
        case _rareKey:
          return 'Rare';
        case _epicKey:
          return 'Epic';
        case _legendaryKey:
          return 'Legendary';

        default:
          return '';
      }
    }

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        height: _rarePanelHeight,
        width: _rarePanelWidth,
        padding: const EdgeInsetsDirectional.all(_rarePadding),
        decoration: const BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.all(
            Radius.circular(
              _borderRadius,
            ),
          ),
          boxShadow: [AppColors.darkShadow],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              rareIcon(),
              color: rareColor(),
              height: _svgSize,
            ),
            Text(
              rareTitle(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: rareColor(),
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
