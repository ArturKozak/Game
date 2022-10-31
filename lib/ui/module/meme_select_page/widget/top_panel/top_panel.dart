import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/ui/module/meme_select_page/widget/top_panel/horizontal_card_menu.dart';
import 'package:game/ui/module/meme_select_page/widget/top_panel/top_panel_title.dart';

class TopPanel extends PageWidget {
  static const _topYOffset = -240;
  static const _animDuration = 400;
  static const _topPanenPadding = 20.0;
  static const _boxShape = 25.0;
  static const _panelHeight = 170.0;
  static const _panelWidht = 320.0;

  const TopPanel({super.key});

  @override
  Widget widgetBody(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 1.0, end: 0.0),
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(0 * value, _topYOffset * value),
          child: child,
        );
      },
      duration: const Duration(milliseconds: _animDuration),
      child: Padding(
        padding: const EdgeInsets.only(top: _topPanenPadding),
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            height: _panelHeight,
            width: _panelWidht,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_boxShape),
              color: AppColors.activeColor,
            ),
            child: Column(
              children: const [
                TopPanelTitle(),
                HorizontalCardMenu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
