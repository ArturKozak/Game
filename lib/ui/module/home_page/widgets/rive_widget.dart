import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:rive/rive.dart';

class RiveWidget extends PageWidget {
  static const _trigger = 'Trigger 1';

  final String state;
  final String riveImage;
  final VoidCallback onTap;

  const RiveWidget({
    required this.state,
    required this.riveImage,
    required this.onTap,
    super.key,
  });

  @override
  Widget widgetBody(BuildContext context, Size size) {
    SMITrigger? bump;
    void onRiveInit(Artboard artboard) {
      final controller = StateMachineController.fromArtboard(artboard, state);

      artboard.addController(controller!);

      bump = controller.findInput<bool>(_trigger) as SMITrigger;
    }

    void hitBump() {
      bump?.fire();

      onTap.call();
    }

    return GestureDetector(
      onTap: hitBump,
      child: SizedBox(
        height: size.height * 0.8,
        width: 310,
        child: RiveAnimation.asset(
          riveImage,
          onInit: onRiveInit,
        ),
      ),
    );
  }
}
