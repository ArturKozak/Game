import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/base/cubit/connection_cubit.dart';
import 'package:game/ui/common/scroll_behavior.dart';
import 'package:game/utils/app_router.gr.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Game());
}

class Game extends StatelessWidget {
  final _connectivity = Connectivity();
  final _appRouter = AppRouter();

  Game({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InternetCubit(connectivity: _connectivity),
      child: MaterialApp.router(
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
        themeMode: ThemeMode.light,
        scrollBehavior: GameScrollBehavior(),
      ),
    );
  }
}
