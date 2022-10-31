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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../data/model/meme/meme_model.dart' as _i6;
import '../ui/module/collection_page/collection_page.dart' as _i3;
import '../ui/module/details_page/meme_details_page.dart' as _i2;
import '../ui/module/meme_select_page/meme_select_page.dart' as _i1;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    MemeSelectRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(child: const _i1.MemeSelectPage()),
      );
    },
    MemeDetailsRoute.name: (routeData) {
      final args = routeData.argsAs<MemeDetailsRouteArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i4.WrappedRoute(
            child: _i2.MemeDetailsPage(
          meme: args.meme,
          key: args.key,
        )),
      );
    },
    MemeGallery.name: (routeData) {
      final args = routeData.argsAs<MemeGalleryArgs>();
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i3.MemeGallery(
          memeCollection: args.memeCollection,
          key: args.key,
        ),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          MemeSelectRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          MemeDetailsRoute.name,
          path: '/meme-details-page',
        ),
        _i4.RouteConfig(
          MemeGallery.name,
          path: '/meme-gallery',
        ),
      ];
}

/// generated route for
/// [_i1.MemeSelectPage]
class MemeSelectRoute extends _i4.PageRouteInfo<void> {
  const MemeSelectRoute()
      : super(
          MemeSelectRoute.name,
          path: '/',
        );

  static const String name = 'MemeSelectRoute';
}

/// generated route for
/// [_i2.MemeDetailsPage]
class MemeDetailsRoute extends _i4.PageRouteInfo<MemeDetailsRouteArgs> {
  MemeDetailsRoute({
    required _i6.MemeModel meme,
    _i5.Key? key,
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

  final _i6.MemeModel meme;

  final _i5.Key? key;

  @override
  String toString() {
    return 'MemeDetailsRouteArgs{meme: $meme, key: $key}';
  }
}

/// generated route for
/// [_i3.MemeGallery]
class MemeGallery extends _i4.PageRouteInfo<MemeGalleryArgs> {
  MemeGallery({
    required List<_i6.MemeModel> memeCollection,
    _i5.Key? key,
  }) : super(
          MemeGallery.name,
          path: '/meme-gallery',
          args: MemeGalleryArgs(
            memeCollection: memeCollection,
            key: key,
          ),
        );

  static const String name = 'MemeGallery';
}

class MemeGalleryArgs {
  const MemeGalleryArgs({
    required this.memeCollection,
    this.key,
  });

  final List<_i6.MemeModel> memeCollection;

  final _i5.Key? key;

  @override
  String toString() {
    return 'MemeGalleryArgs{memeCollection: $memeCollection, key: $key}';
  }
}
