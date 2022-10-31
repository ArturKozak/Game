import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/base/cubit/connection_cubit.dart';
import 'package:game/ui/module/meme_select_page/cubit/select_cubit/select_meme_cubit.dart';
import 'package:game/ui/module/meme_select_page/cubit/view_cubit/meme_view_cubit.dart';
import 'package:game/ui/module/meme_select_page/meme_select_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(Game());
}

class Game extends StatelessWidget {
  final connectivity = Connectivity();

  Game({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => InternetCubit(connectivity: connectivity),
      child: MaterialApp(
        themeMode: ThemeMode.light,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => SelectMemeCubit(),
            ),
            BlocProvider(
              create: (context) => MemeViewCubit(
                BlocProvider.of<SelectMemeCubit>(context),
              )..init(),
            ),
          ],
          child: const MemeSelectPage(),
        ),
      ),
    );
  }
}
