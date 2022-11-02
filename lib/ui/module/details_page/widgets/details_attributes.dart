import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';
import 'package:game/constants/app_svg.dart';
import 'package:game/data/model/meme/meme_model.dart';

class DetailsAttributes extends PageWidget {
  static const _teddyKey = 'teddy';
  static const _lanternKey = 'lantern';
  static const _heartKey = 'heart';
  static const _powerKey = 'power';
  static const _notesKey = 'notes';

  static const _borderRadius = 25.0;
  static const _rarePadding = 5.0;
  static const _attributesPanelHeight = 50.0;
  static const _attributesVerticalPadding = 15.0;
  static const _iconSize = 50.0;
  static const _svgSize = 40.0;

  final MemeModel meme;

  const DetailsAttributes({
    required this.meme,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context, Size size) {
    String attrIcon(String attr) {
      switch (attr) {
        case _teddyKey:
          return AppIcons.teddyAttr;

        case _lanternKey:
          return AppIcons.lanternAttr;
        case _heartKey:
          return AppIcons.heartAttr;
        case _powerKey:
          return AppIcons.powerAttr;
        case _notesKey:
          return AppIcons.notesAttr;

        default:
          return AppIcons.crystal;
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: _attributesVerticalPadding),
      child: SizedBox(
        width: size.width * 0.9,
        height: _attributesPanelHeight,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: AppConstants.smallPadding,
                right: AppConstants.smallPadding * 2,
              ),
              child: Text(
                ' Meme Attributes:',
                maxLines: 1,
                style: TextStyle(
                  color: AppColors.activeColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppConstants.smallPadding),
                  shrinkWrap: true,
                  itemCount: meme.attributes.length,
                  scrollDirection: Axis.horizontal,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    final item = meme.attributes[index];

                    return Align(
                      widthFactor: 0.9,
                      child: Container(
                        height: _iconSize,
                        width: _iconSize,
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
                        child: SvgPicture.asset(
                          attrIcon(item),
                          height: _svgSize,
                          width: _svgSize,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
