import 'package:flutter/material.dart';
import 'package:game/base/connection_page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_images.dart';
import 'package:game/ui/module/home_page/widgets/rive__text_widget.dart';
import 'package:game/ui/module/home_page/widgets/rive_widget.dart';
import 'package:game/utils/router.dart';

class HomePage extends ConnectionPageBase {
  const HomePage({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    return Scaffold(
      body: this,
    );
  }

  @override
  Widget readyContent(BuildContext context, Size size) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: size.height * -0.02,
            child: RiveWidget(
              state: 'State Machine 1',
              riveImage: AppImages.logo,
              onTap: () {},
            ),
          ),
          Positioned(
            right: 10,
            top: size.height * 0.1,
            child: RiveTextWidget(
              state: 'State Machine 1',
              title: 'New Game',
              riveImage: AppImages.newGame,
              alignment: const Alignment(0.55, 0.35),
              onTap: () => GameRouter.toNewGamePage(context),
            ),
          ),
          Positioned(
            right: 10,
            top: size.height * 0.3,
            child: RiveTextWidget(
              state: 'State Machine 1',
              title: 'Join to Game',
              riveImage: AppImages.joinToGame,
              alignment: const Alignment(0, 0.35),
              onTap: () => GameRouter.toSelectPage(context),
            ),
          ),
          Positioned(
            right: 10,
            top: size.height * 0.49,
            child: RiveTextWidget(
              state: 'State Machine 1',
              title: 'Collection',
              riveImage: AppImages.collection,
              alignment: const Alignment(-0.55, 0.05),
              onTap: () => GameRouter.toCollectionPage(context),
            ),
          ),
          Positioned(
            right: 10,
            top: size.height * 0.65,
            child: RiveTextWidget(
              state: 'State Machine 1',
              title: 'Account',
              riveImage: AppImages.account,
              alignment: const Alignment(0.35, 0.05),
              onTap: () => GameRouter.toCollectionPage(context),
            ),
          ),
        ],
      ),
    );
  }
}
