import 'package:animated_widgets/widgets/translation_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/constants/app_colors.dart';
import 'package:game/constants/app_constants.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/meme_card/meme_card.dart';
import 'package:game/ui/module/details_page/meme_details_page.dart';
import 'package:game/ui/module/meme_select_page/cubit/view_cubit/meme_view_cubit.dart';
import 'package:game/ui/module/meme_select_page/widget/custom/bottom_button.dart';

class TranslationCustomWidget extends StatefulWidget {
  final MemeModel item;
  final double? position;

  const TranslationCustomWidget({
    required this.item,
    this.position,
    super.key,
  });

  @override
  State<TranslationCustomWidget> createState() =>
      _TranslationCustomWidgetState();
}

class _TranslationCustomWidgetState extends State<TranslationCustomWidget> {
  static const _borderRadius = 25.0;
  static const _primaryBottomPosition = 40.0;
  static const _primaryWidth = 300.0;
  static const _primaryHeight = 400.0;
  static const _primaryExpandedHeight = 290.0;
  static const _secondaryHeight = 70.0;

  bool isExanded = false;

  void _onTap() {
    setState(() {
      isExanded = !isExanded;
    });
  }

  Future<void> _selectMeme() async {
    setState(() {
      isExanded = false;

      widget.item.selected = true;
    });

    await Future.delayed(const Duration(seconds: 1));

    // ignore: use_build_context_synchronously
    await context.read<MemeViewCubit>().onClicked(meme: widget.item);
  }

  void _navigate(MemeModel meme) => Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) {
            final curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOut,
            );

            return FadeTransition(
              opacity: curvedAnimation,
              child: MemeDetailsPage(meme: meme),
            );
          },
        ),
      );

  @override
  Widget build(BuildContext context) {
    return TranslationAnimatedWidget(
      enabled: widget.item.selected,
      curve: Curves.easeIn,
      duration: const Duration(seconds: 1),
      values: const [
        Offset(0, -10),
        Offset(0, -70),
        Offset(0, 300.0),
      ],
      animationFinished: (_) => context.read<MemeViewCubit>().update(),
      child: Container(
        margin: const EdgeInsetsDirectional.only(start: 15, end: 15),
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              duration: AppConstants.animDuration,
              bottom: isExanded ? 0 : _primaryBottomPosition,
              width: _primaryWidth,
              height: isExanded ? _primaryHeight : _primaryExpandedHeight,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  color: AppColors.darkBackColor,
                  boxShadow: const [AppColors.darkShadow],
                ),
                child: Align(
                  alignment: const Alignment(0, 0.9),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      BottomButtom(
                        onTap: () => _selectMeme(),
                        label: 'Select',
                      ),
                      BottomButtom(
                        onTap: () => _navigate(widget.item),
                        label: 'Details',
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              duration: AppConstants.animDuration,
              bottom: isExanded ? _secondaryHeight : 0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: _onTap,
                child: MemeCard(
                  meme: widget.item,
                  isShadow: true,
                  position: widget.position,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
