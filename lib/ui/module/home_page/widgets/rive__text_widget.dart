import 'package:flutter/material.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:rive/rive.dart';

class RiveTextWidget extends PageWidget {
  static const _trigger = 'Trigger 1';

  final String state;
  final String title;
  final String riveImage;
  final Alignment alignment;
  final VoidCallback onTap;

  const RiveTextWidget({
    required this.state,
    required this.title,
    required this.riveImage,
    required this.alignment,
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
        height: 180,
        width: 220,
        child: Stack(
          children: [
            RiveAnimation.asset(
              riveImage,
              onInit: onRiveInit,
            ),
            Align(
              alignment: alignment,
              child: Text(
                title,
                style: const TextStyle(
                  color: AppColors.darkBackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
