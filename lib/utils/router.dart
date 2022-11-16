import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/utils/app_router.gr.dart';

class GameRouter {
  const GameRouter._();

  static void toDetailsPage(MemeModel meme, BuildContext context) {
    AutoRouter.of(context).push(
      MemeDetailsRoute(meme: meme),
    );
  }

  static void toCollectionPage(BuildContext context) {
    AutoRouter.of(context).pushNamed(
      '/meme-gallery',
    );
  }

  static void toSelectPage(BuildContext context) {
    AutoRouter.of(context).pushNamed(
      '/meme-select-page',
    );
  }

  static void toHomePage(BuildContext context) {
    AutoRouter.of(context).pushNamed(
      '/',
    );
  }

    static void toNewGamePage(BuildContext context) {
    AutoRouter.of(context).pushNamed(
      '/new-game-page',
    );
  }
}
