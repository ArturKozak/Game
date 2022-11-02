import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_constants.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/transformer_page/paralax.dart';

class MemeCardImage extends PageWidget {
  final MemeModel meme;
  final double? position;

  const MemeCardImage({
    required this.meme,
    this.position,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context, Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.infinity,
        height: size.height * 0.34,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(AppConstants.borderRadius),
          child: position != null
              ? ParallaxImage.network(
                  meme.image,
                  position: position!,
                )
              : Image.network(
                  meme.image,
                  fit: BoxFit.cover,
                ),
        ),
      ),
    );
  }
}
