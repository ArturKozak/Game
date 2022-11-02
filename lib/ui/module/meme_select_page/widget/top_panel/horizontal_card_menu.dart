import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/base/page_base.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';
import 'package:game/ui/module/meme_select_page/cubit/select_cubit/select_meme_cubit.dart';

class HorizontalCardMenu extends PageWidget {
  static const cardWidht = 55.0;
  static const cardMargin = 4.0;
  static const cardHeight = 45.0;
  static const heightFactor = .5;
  static const borderRadius = 10.0;

  const HorizontalCardMenu({super.key});

  @override
  Widget widgetBody(BuildContext context, Size size) {
    return Expanded(
      child: BlocBuilder<SelectMemeCubit, SelectMemeState>(
        builder: (context, state) {
          if (state is SelectMemeAdded) {
            return ListView.builder(
              padding: const EdgeInsets.symmetric(
                vertical: AppConstants.smallPadding * 2,
              ),
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.props.length,
              itemBuilder: ((context, index) {
                final meme = state.props[index];

                return Align(
                  alignment: Alignment.bottomCenter,
                  heightFactor: heightFactor,
                  child: Container(
                    width: cardWidht,
                    height: cardHeight,
                    margin: const EdgeInsets.all(cardMargin),
                    decoration: const BoxDecoration(
                      color: AppColors.activeColor,
                      borderRadius:
                          BorderRadius.all(Radius.circular(borderRadius)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(borderRadius),
                      child: Image.network(
                        meme.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              }),
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
