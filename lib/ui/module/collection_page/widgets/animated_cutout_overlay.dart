import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:game/base/page_base.dart';

class AnimatedCutoutOverlay extends PageWidget {
  final Widget child;
  final Size cutoutSize;
  final Key animationKey;
  final Offset swipeDir;
  final Duration? duration;
  final double opacity;

  const AnimatedCutoutOverlay(
      {Key? key,
      required this.child,
      required this.cutoutSize,
      required this.animationKey,
      this.duration,
      required this.swipeDir,
      required this.opacity})
      : super(key: key);

  @override
  Widget widgetBody(BuildContext context) {
    return Stack(
      children: [
        child,
        Animate(
          effects: [
            CustomEffect(
              builder: (_, __, child) => _buildAnimatedCutout(child),
            )
          ],
          key: animationKey,
          child: IgnorePointer(
            child: Container(
              color: Colors.black.withOpacity(opacity),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedCutout(Widget child) {
    final size = Size(cutoutSize.width, cutoutSize.height);

    return ClipPath(clipper: _CutoutClipper(size), child: child);
  }
}

class _CutoutClipper extends CustomClipper<Path> {
  _CutoutClipper(this.cutoutSize);

  final Size cutoutSize;

  @override
  Path getClip(Size size) {
    double padX = (size.width - cutoutSize.width) / 2;
    double padY = (size.height - cutoutSize.height) / 2;

    return Path.combine(
      PathOperation.difference,
      Path()..addRect(Rect.fromLTWH(0, 0, size.width, size.height)),
      Path()
        ..addRRect(
          RRect.fromLTRBR(
            padX,
            padY,
            size.width - padX,
            size.height - padY - 10,
            const Radius.circular(25),
          ),
        )
        ..close(),
    );
  }

  @override
  bool shouldReclip(_CutoutClipper oldClipper) =>
      oldClipper.cutoutSize != cutoutSize;
}
