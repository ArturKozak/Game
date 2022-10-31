import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/meme_card/meme_card_image.dart';
import 'package:game/ui/common/meme_card/meme_card_info_panel.dart';
import 'package:game/ui/common/meme_card/meme_card_rare.dart';
import 'package:game/ui/common/meme_card/meme_card_title_panel.dart';

class MemeCard extends PageWidget {
  static const _borderWidth = 8.0;
  static const _borderRadius = 25.0;

  static const cardWidth = 300.0;
  static const cardHeight = 400.0;

  final MemeModel meme;
  final bool isShadow;
  final double? position;

  const MemeCard({
    required this.meme,
    this.isShadow = false,
    this.position,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppConstants.smallPadding),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: cardHeight,
          width: cardWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(_borderRadius),
            color: AppColors.darkBackColor,
            border: Border.all(
              width: _borderWidth,
              color: AppColors.darkBackColor,
            ),
            boxShadow: isShadow ? const [AppColors.darkShadow] : null,
          ),
          child: Stack(
            children: [
              MemeCardImage(
                meme: meme,
                position: position,
              ),
              MemeCardInfoPanel(meme: meme),
              MemeCardTitlePanel(meme: meme),
              MemeCardRare(meme: meme),
            ],
          ),
        ),
      ),
    );
  }
}
