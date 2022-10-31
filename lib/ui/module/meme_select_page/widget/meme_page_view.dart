// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/base/page_base.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/transformer_page/transformer_page_view.dart';
import 'package:game/ui/module/meme_select_page/cubit/view_cubit/meme_view_cubit.dart';
import 'package:game/ui/module/meme_select_page/widget/custom/translation_widget.dart';

class MemePageView extends PageWidget {
  static const _pageViewHeight = 500.0;

  const MemePageView({super.key});

  @override
  Widget widgetBody(BuildContext context) {
    return BlocBuilder<MemeViewCubit, MemeViewState>(
      builder: (context, state) {
        final pageController = context.read<MemeViewCubit>().pageController;

        if (state is MemeViewCardLoaded) {
          return SizedBox(
            height: _pageViewHeight,
            child: TransformerPageView(
              loop: true,
              viewportFraction: 0.8,
              itemCount: state.props.length,
              controller: pageController,
              transformer: PageTransformerBuilder(
                builder: (Widget child, TransformInfo info) {
                  MemeModel item = state.props[info.index!];

                  return TranslationCustomWidget(
                    item: item,
                    position: info.position,
                  );
                },
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
