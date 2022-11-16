import 'package:flutter/material.dart';
import 'package:game/base/connection_page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';
import 'package:game/ui/common/game_button.dart';
import 'package:game/ui/module/new_game_page/widgets/new_game_button.dart';
import 'package:game/ui/module/new_game_page/widgets/new_game_key_ingo.dart';

class NewGamePage extends ConnectionPageBase {
  const NewGamePage({super.key});

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
      body: SafeArea(
        child: Align(
          alignment: const AlignmentDirectional(0.05, -0.85),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              NewGameButton(
                backgroundColor: AppColors.activeColor,
                title: 'Two players',
                onTap: () {},
              ),
              NewGameButton(
                backgroundColor: AppColors.firstLightColor,
                title: 'Three players',
                onTap: () {},
              ),
              NewGameButton(
                backgroundColor: AppColors.threeLightColor,
                title: 'Four players',
                onTap: () {},
              ),
              Container(
                width: size.width * 0.85,
                height: size.height * 0.45,
                decoration: BoxDecoration(
                  color: AppColors.darkBackColor,
                  boxShadow: const [AppColors.darkShadow],
                  borderRadius:
                      BorderRadius.circular(AppConstants.borderRadius),
                  shape: BoxShape.rectangle,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Text(
                      'Players: 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE8B06C),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Game session key',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFE8B06C),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    NewGameKeyInfo(),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                        AppConstants.smallPadding,
                        0,
                        AppConstants.smallPadding,
                        0,
                      ),
                      child: GameButton(title: 'Start Game'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
