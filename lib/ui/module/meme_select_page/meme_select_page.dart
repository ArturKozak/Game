import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/base/connection_page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/ui/module/meme_select_page/cubit/select_cubit/select_meme_cubit.dart';
import 'package:game/ui/module/meme_select_page/cubit/view_cubit/meme_view_cubit.dart';
import 'package:game/ui/module/meme_select_page/widget/meme_page_view.dart';
import 'package:game/ui/module/meme_select_page/widget/top_panel/top_panel.dart';

class MemeSelectPage extends ConnectionPageBase {
  const MemeSelectPage({super.key});

  @override
  Widget wrappedRoute(context) {
    return MultiBlocProvider(
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
      child: this,
    );
  }

  @override
  Widget readyContent(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: const [
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MemePageView(),
            ),
            TopPanel(),
          ],
        ),
      ),
    );
  }
}
