import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:game/base/page_base.dart';
import 'package:game/constants/app_constants.dart';

class DetailsImageBackground extends PageWidget {
  static const _sigma = 6.0;
  static const _horizontalPosition = 15.0;

  final String image;

  const DetailsImageBackground({
    required this.image,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context, Size size) {
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
                  filter: ImageFilter.blur(
                    sigmaX: _sigma,
                    sigmaY: _sigma,
                  ),
                  child: Container(
                    color: Colors.grey.withOpacity(0.2),
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: size.height * 0.12,
          left: _horizontalPosition,
          right: _horizontalPosition,
          child: SizedBox(
            width: size.width * 0.9,
            height: size.height * 0.35,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppConstants.borderRadius),
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
