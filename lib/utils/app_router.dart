import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:game/ui/module/collection_page/collection_page.dart';
import 'package:game/ui/module/details_page/meme_details_page.dart';
import 'package:game/ui/module/meme_select_page/meme_select_page.dart';

typedef CustomRouteBuilder = Route<T> Function<T>(
    BuildContext context, Widget child, CustomPage page);

Route<T> fadeRouteBuilder<T>(
    BuildContext context, Widget child, CustomPage<T> page) {
  return PageRouteBuilder(
    fullscreenDialog: page.fullscreenDialog,
    settings: page,
    pageBuilder: (context, animation, secondaryAnimation) {
      final curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeInOut,
      );

      return FadeTransition(
        opacity: curvedAnimation,
        child: child,
      );
    },
  );
}

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CustomRoute(
      page: MemeSelectPage,
      initial: true,
      customRouteBuilder: fadeRouteBuilder,
    ),
    CustomRoute(
      page: MemeDetailsPage,
      initial: true,
      customRouteBuilder: fadeRouteBuilder,
    ),
    CustomRoute(
      page: MemeGallery,
      initial: true,
      customRouteBuilder: fadeRouteBuilder,
    ),
  ],
)
class $AppRouter {}
