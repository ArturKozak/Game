import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/transformer_page/paralax.dart';

class MemeCardImage extends PageWidget {
  static const _borderRadius = 16.0;
  static const _imageHeight = 270.0;

  final MemeModel meme;
  final double? position;

  const MemeCardImage({
    required this.meme,
    this.position,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        width: double.infinity,
        height: _imageHeight,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(_borderRadius),
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
