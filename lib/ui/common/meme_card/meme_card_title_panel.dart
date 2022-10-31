import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/data/model/meme/meme_model.dart';

class MemeCardTitlePanel extends PageWidget {
  static const _panelHeight = 80.0;
  static const _panelLeftPosition = 10.0;
  static const _panelBottomPosition = 70.0;

  final MemeModel meme;

  const MemeCardTitlePanel({super.key, required this.meme});

  @override
  Widget widgetBody(BuildContext context) {
    return Positioned(
      bottom: _panelBottomPosition,
      left: _panelLeftPosition,
      right: 0,
      child: SizedBox(
        height: _panelHeight,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              meme.title,
              style: const TextStyle(
                color: AppColors.activeColor,
                fontSize: 22.0,
                fontWeight: FontWeight.w900,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
