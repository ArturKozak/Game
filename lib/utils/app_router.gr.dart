// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:flutter/material.dart' as _i7;

import '../data/model/meme/meme_model.dart' as _i9;
import '../ui/module/collection_page/collection_page.dart' as _i4;
import '../ui/module/details_page/meme_details_page.dart' as _i3;
import '../ui/module/home_page/home_page.dart' as _i1;
import '../ui/module/meme_select_page/meme_select_page.dart' as _i2;
import '../ui/module/new_game_page/new_game_page.dart' as _i5;
import 'app_router.dart' as _i8;

class AppRouter extends _i6.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i1.HomePage()),
        customRouteBuilder: _i8.fadeRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MemeSelectRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i2.MemeSelectPage()),
        customRouteBuilder: _i8.fadeRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MemeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MemeDetailsRouteArgs>();
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(
            child: _i3.MemeDetailsPage(
          meme: args.meme,
          key: args.key,
        )),
        customRouteBuilder: _i8.fadeRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MemeGallery.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: const _i4.MemeGallery(),
        customRouteBuilder: _i8.fadeRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
    NewGameRoute.name: (routeData) {
      return _i6.CustomPage<dynamic>(
        routeData: routeData,
        child: _i6.WrappedRoute(child: const _i5.NewGamePage()),
        customRouteBuilder: _i8.fadeRouteBuilder,
        opaque: true,
        barrierDismissible: false,
      );
    },
  };

  @override
  List<_i6.RouteConfig> get routes => [
        _i6.RouteConfig(
          HomeRoute.name,
          path: '/',
        ),
        _i6.RouteConfig(
          MemeSelectRoute.name,
          path: '/meme-select-page',
        ),
        _i6.RouteConfig(
          MemeDetailsRoute.name,
          path: '/meme-details-page',
        ),
        _i6.RouteConfig(
          MemeGallery.name,
          path: '/meme-gallery',
        ),
        _i6.RouteConfig(
          NewGameRoute.name,
          path: '/new-game-page',
        ),
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute()
      : super(
          HomeRoute.name,
          path: '/',
        );

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i2.MemeSelectPage]
class MemeSelectRoute extends _i6.PageRouteInfo<void> {
  const MemeSelectRoute()
      : super(
          MemeSelectRoute.name,
          path: '/meme-select-page',
        );

  static const String name = 'MemeSelectRoute';
}

/// generated route for
/// [_i3.MemeDetailsPage]
class MemeDetailsRoute extends _i6.PageRouteInfo<MemeDetailsRouteArgs> {
  MemeDetailsRoute({
    required _i9.MemeModel meme,
    _i7.Key? key,
  }) : super(
          MemeDetailsRoute.name,
          path: '/meme-details-page',
          args: MemeDetailsRouteArgs(
            meme: meme,
            key: key,
          ),
        );

  static const String name = 'MemeDetailsRoute';
}

class MemeDetailsRouteArgs {
  const MemeDetailsRouteArgs({
    required this.meme,
    this.key,
  });

  final _i9.MemeModel meme;

  final _i7.Key? key;

  @override
  String toString() {
    return 'MemeDetailsRouteArgs{meme: $meme, key: $key}';
  }
}

/// generated route for
/// [_i4.MemeGallery]
class MemeGallery extends _i6.PageRouteInfo<void> {
  const MemeGallery()
      : super(
          MemeGallery.name,
          path: '/meme-gallery',
        );

  static const String name = 'MemeGallery';
}

/// generated route for
/// [_i5.NewGamePage]
class NewGameRoute extends _i6.PageRouteInfo<void> {
  const NewGameRoute()
      : super(
          NewGameRoute.name,
          path: '/new-game-page',
        );

  static const String name = 'NewGameRoute';
}
