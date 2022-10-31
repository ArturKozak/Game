import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:game/base/page_base.dart';

class DetailsImageBackground extends PageWidget {
  static const _sigma = 6.0;
  static const _borderRadius = 16.0;
  static const _topPosition = 110.0;
  static const _horizontalPosition = 15.0;

  final String image;

  const DetailsImageBackground({
    required this.image,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.6,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.network(image, fit: BoxFit.cover),
              ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: _sigma, sigmaY: _sigma),
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: _topPosition,
          left: _horizontalPosition,
          right: _horizontalPosition,
          child: SizedBox(
            width: size.width * 0.9,
            height: size.height * 0.35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(_borderRadius),
              child: Image.network(
                image,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
