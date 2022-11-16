import 'package:flutter/material.dart';
import 'package:game/base/connection_page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/chart/details/details_bar_chart_statistic.dart';
import 'package:game/ui/module/details_page/widgets/details_attributes.dart';
import 'package:game/ui/module/details_page/widgets/details_image_background.dart';
import 'package:game/ui/module/details_page/widgets/details_rare_info.dart';
import 'package:game/ui/module/details_page/widgets/details_title.dart';
import 'package:game/ui/common/game_button.dart';

class MemeDetailsPage extends ConnectionPageBase {
  static const _bottomMargin = 70.0;

  final MemeModel meme;

  const MemeDetailsPage({required this.meme, super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return Scaffold(
      body: this,
    );
  }

  @override
  Widget readyContent(BuildContext context, Size size) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: [
            DetailsImageBackground(image: meme.image),
            Align(
              heightFactor: 0.8,
              child: Container(
                width: size.width * 0.9,
                margin: const EdgeInsets.only(bottom: _bottomMargin),
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius),
                  color: AppColors.darkBackColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DetailsTitle(title: meme.title),
                    DetailsRareInfo(meme: meme),
                    DetailsBarChartStatistic(meme: meme),
                    DetailsAttributes(meme: meme),
                    const GameButton(title: 'Sell Meme'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
