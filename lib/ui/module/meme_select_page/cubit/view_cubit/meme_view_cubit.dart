import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:game/data/model/meme/meme_model.dart';
import 'package:game/ui/common/transformer_page/index_controller.dart';
import 'package:game/ui/module/meme_select_page/cubit/select_cubit/select_meme_cubit.dart';

part 'meme_view_state.dart';

class MemeViewCubit extends Cubit<MemeViewState> {
  final SelectMemeCubit selectMemeCubit;

  final _pageController = IndexController();

  final _memes = MemeRepo.memes;

  IndexController get pageController => _pageController;

  MemeViewCubit(this.selectMemeCubit) : super(MemeViewInitial());

  void init() async {
    emit(MemeViewCardLoaded(memes: _memes));
  }

  Future<void> onClicked({required MemeModel meme}) async {
    final index = _memes.indexWhere((element) => element.title == meme.title);

    _memes.removeAt(index);

    selectMemeCubit.update(meme);
  }

  void update() {
    emit(MemeViewInitial());

    emit(MemeViewCardLoaded(memes: _memes));
  }

  @override
  Future<void> close() async {
    _pageController.dispose();

    return super.close();
  }
}
